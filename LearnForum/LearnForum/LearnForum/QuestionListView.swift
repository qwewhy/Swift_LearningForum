import SwiftUI
import LearnForumAPIClient

struct QuestionListView: View {
    let questionBank: QuestionBank
    
    @StateObject private var viewModel = QuestionListViewModel()
    
    var body: some View {
        VStack(spacing: 0) {
            // 题库基本信息
            if !viewModel.isLoading && viewModel.errorMessage == nil && !viewModel.needLogin {
                BankInfoHeaderView(bank: questionBank)
            }
            
            // 内容区域
            if viewModel.isLoading {
                LoadingStateView()
            } else if viewModel.needLogin {
                LoginPromptStateView()
            } else if let errorMessage = viewModel.errorMessage {
                ErrorStateView(
                    error: errorMessage,
                    responseDebugInfo: viewModel.responseDebugInfo,
                    retryAction: { viewModel.loadQuestions(for: questionBank) }
                )
            } else if viewModel.filteredQuestions.isEmpty {
                EmptyListStateView(
                    responseDebugInfo: viewModel.responseDebugInfo,
                    reloadAction: { viewModel.loadQuestions(for: questionBank) }
                )
            } else {
                QuestionsList(questions: viewModel.filteredQuestions)
            }
        }
        .navigationTitle(questionBank.title ?? "Question Bank")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    viewModel.loadQuestions(for: questionBank)
                } label: {
                    Image(systemName: "arrow.clockwise")
                }
            }
        }
        .onAppear {
            viewModel.loadQuestions(for: questionBank)
        }
    }
}

class QuestionListViewModel: ObservableObject {
    @Published var questions: [QuestionVO] = []
    @Published var filteredQuestions: [QuestionVO] = []
    @Published var bankDetail: QuestionBankVO?
    @Published var isLoading = false
    @Published var errorMessage: String? = nil
    @Published var responseDebugInfo: String = ""
    @Published var needLogin = false
    
    private let pageSize = 200
    
    // 根据题库名称筛选题目
    private func filterQuestionsByBankTitle(_ questions: [QuestionVO], bankTitle: String?) -> [QuestionVO] {
        guard let bankTitle = bankTitle, !bankTitle.isEmpty else {
            // 如果题库名称为空，返回所有题目
            return questions
        }
        
        // 筛选标签包含题库名称的题目
        return questions.filter { question in
            guard let tagList = question.tagList else {
                return false
            }
            
            return tagList.contains(bankTitle)
        }
    }
    
    func loadQuestions(for questionBank: QuestionBank) {
        isLoading = true
        errorMessage = nil
        responseDebugInfo = ""
        needLogin = false
        
        guard let questionBankIdString = questionBank.id, !questionBankIdString.isEmpty else {
            errorMessage = "Missing question bank ID"
            isLoading = false
            return
        }
        
        // 转换题库ID类型
        guard let questionBankId = Int64(questionBankIdString) else {
            errorMessage = "Invalid question bank ID format: \(questionBankIdString)"
            isLoading = false
            return
        }
        
        // 使用API获取题库详情和题目
        QuestionBankControllerAPI.getQuestionBankVOByIdUsingGET(
            id: questionBankId,
            needQueryQuestionList: true,
            pageSize: pageSize
        ) { [weak self] response, error in
            guard let self = self else { return }
            
            self.isLoading = false
            
            if let error = error {
                self.errorMessage = "API Error: \(error.localizedDescription)"
                return
            }
            
            // 检查未登录错误
            if let code = response?.code, code == 40100 {
                self.needLogin = true
                self.errorMessage = "Please login first"
                return
            }
            
            if let bankData = response?.data {
                self.bankDetail = bankData
                
                // 处理题目数据
                if let questionPage = bankData.questionPage, let records = questionPage.records {
                    self.questions = records
                    
                    // 根据题库名称筛选题目
                    self.filteredQuestions = self.filterQuestionsByBankTitle(records, bankTitle: questionBank.title)
                } else {
                    self.questions = []
                    self.filteredQuestions = []
                }
            } else {
                self.errorMessage = "No data in response"
            }
        }
    }
}


// 加载中视图
struct LoadingStateView: View {
    var body: some View {
        VStack {
            Spacer()
            ProgressView()
                .scaleEffect(1.5)
                .padding()
            Text("Loading...")
                .foregroundColor(.secondary)
                .padding(.top)
            Spacer()
        }
    }
}

// 登录提示视图
struct LoginPromptStateView: View {
    var body: some View {
        VStack {
            Spacer()
            Text("Please Login")
                .font(.title)
                .padding()
            
            Text("You need to login to view question bank questions")
                .foregroundColor(.gray)
                .padding()
            
            Button("Back to Login") {
                NotificationCenter.default.post(name: .userLoggedOut, object: nil)
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(8)
            Spacer()
        }
    }
}

// 错误信息视图
struct ErrorStateView: View {
    let error: String
    let responseDebugInfo: String
    let retryAction: () -> Void
    
    var body: some View {
        VStack {
            Spacer()
            Text("Error Occurred")
                .font(.title)
                .foregroundColor(.red)
                .padding()
            
            Text(error)
                .foregroundColor(.gray)
                .padding()
            
            if !responseDebugInfo.isEmpty {
                Text("Debug Information:")
                    .font(.headline)
                    .padding(.top)
                
                ScrollView {
                    Text(responseDebugInfo)
                        .font(.system(.caption, design: .monospaced))
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .frame(height: 150)
                .background(Color.black.opacity(0.05))
                .cornerRadius(8)
                .padding()
            }
            
            Button("Retry", action: retryAction)
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(8)
            Spacer()
        }
    }
}

// 空状态视图
struct EmptyListStateView: View {
    let responseDebugInfo: String
    let reloadAction: () -> Void
    
    var body: some View {
        VStack {
            Spacer()
            Text("No Questions Found")
                .font(.title2)
                .foregroundColor(.gray)
                .padding()
            
            if !responseDebugInfo.isEmpty {
                Text("Debug Information:")
                    .font(.headline)
                    .padding(.top)
                
                ScrollView {
                    Text(responseDebugInfo)
                        .font(.system(.caption, design: .monospaced))
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .frame(height: 150)
                .background(Color.black.opacity(0.05))
                .cornerRadius(8)
                .padding()
            }
            
            Button("Refresh", action: reloadAction)
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(8)
            Spacer()
        }
    }
}

// 问题列表视图
struct QuestionsList: View {
    let questions: [QuestionVO]
    
    var body: some View {
        List {
            ForEach(questions, id: \.id) { question in
                NavigationLink(destination: QuestionDetailView(questionId: question.id.flatMap { Int64($0) })) {
                    QuestionRow(question: question)
                }
            }
        }
        .listStyle(PlainListStyle())
    }
}

// 问题行视图
struct QuestionRow: View {
    let question: QuestionVO
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            // 题目信息
            VStack(alignment: .leading, spacing: 4) {
                Text(question.title ?? "Untitled")
                    .font(.headline)
                    .lineLimit(1)
                
                if let content = question.content, !content.isEmpty {
                    Text(content)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .lineLimit(2)
                }
            }
            
            // 额外信息
            HStack {
                if let createTime = question.createTime {
                    Text("Created: \(formattedDate(createTime))")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                
                Spacer()
                
                // 标签显示
                QuestionTagsView(tagList: question.tagList)
            }
        }
        .padding(.vertical, 8)
    }
    
    private func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter.string(from: date)
    }
}

// 标签视图
struct QuestionTagsView: View {
    let tagList: [String]?
    
    var body: some View {
        HStack(spacing: 4) {
            if let tagList = tagList, !tagList.isEmpty {
                ForEach(tagList.prefix(2), id: \.self) { tag in
                    Text(tag)
                        .font(.caption)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 3)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(4)
                }
                
                if tagList.count > 2 {
                    Text("+\(tagList.count - 2)")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
            }
        }
    }
}

// 题库信息头部视图
struct BankInfoHeaderView: View {
    let bank: QuestionBank
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            // 题库图片
            if let pictureString = bank.picture, !pictureString.isEmpty {
                BankImageView(pictureURL: getImageURL(from: pictureString))
            }
            
            // 题库信息
            VStack(alignment: .leading, spacing: 8) {
                if let description = bank.description, !description.isEmpty {
                    Text(description)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        .padding(.horizontal)
                }
                
                HStack {
                    if let createTime = bank.createTime {
                        Label(formattedDate(createTime), systemImage: "calendar")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                    
                    Spacer()
                    
                    Text("ID: \(bank.id ?? "Unknown")")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                .padding(.horizontal)
            }
            .padding(.vertical, 8)
            
            Divider()
        }
        .background(Color(UIColor.systemBackground))
    }
    
    private func getImageURL(from pictureString: String) -> URL? {
        if pictureString.lowercased().hasPrefix("http://") || pictureString.lowercased().hasPrefix("https://") {
            return URL(string: pictureString)
        }
        return URL(string: "\(LearnForumAPIClientAPI.basePath)/\(pictureString)")
    }
    
    private func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter.string(from: date)
    }
}

// 题库图片视图
struct BankImageView: View {
    let pictureURL: URL?
    
    var body: some View {
        CachedAsyncImage(url: pictureURL) { phase in
            switch phase {
            case .empty:
                Rectangle()
                    .fill(Color.gray.opacity(0.1))
                    .frame(height: 150)
            case .success(let image):
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 150)
                    .clipped()
            case .failure:
                Rectangle()
                    .fill(Color.gray.opacity(0.1))
                    .frame(height: 150)
                    .overlay(
                        Image(systemName: "photo")
                            .font(.largeTitle)
                            .foregroundColor(.gray)
                    )
            @unknown default:
                EmptyView()
            }
        }
    }
}

#Preview {
    NavigationView {
        QuestionListView(questionBank: QuestionBank(
            id: "1001",
            title: "Sample Question Bank"
        ))
    }
} 