import SwiftUI
import LearnForumAPIClient


struct QuestionBankView: View {
    @State private var questionBanks: [QuestionBank] = []
    @State private var isLoading = false
    @State private var errorMessage: String? = nil
    @State private var currentPage = 1
    @State private var pageSize = 10
    @State private var needLogin = false
    
    var body: some View {
        NavigationView {
            VStack {
                if isLoading {
                    ProgressView()
                        .scaleEffect(1.5)
                        .padding()
                } else if needLogin {
                    VStack {
                        Text("Please Login First")
                            .font(.title)
                            .padding()
                        
                        Text("You need to login to view question banks")
                            .foregroundColor(.gray)
                            .padding()
                        
                        Button("Back to Login") {
                            // 发送退出登录通知，回到登录界面
                            NotificationCenter.default.post(name: .userLoggedOut, object: nil)
                        }
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                    }
                } else if let error = errorMessage {
                    VStack {
                        Text("Error Occurred")
                            .font(.title)
                            .foregroundColor(.red)
                            .padding()
                        
                        Text(error)
                            .foregroundColor(.gray)
                            .padding()
                        
                        Button("Retry") {
                            loadQuestionBanks()
                        }
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                    }
                } else if questionBanks.isEmpty {
                    VStack {
                        Text("No Question Banks Found")
                            .font(.title2)
                            .foregroundColor(.gray)
                            .padding()
                        
                        Button("Refresh") {
                            loadQuestionBanks()
                        }
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                    }
                } else {
                    List {
                        ForEach(questionBanks, id: \.id) { bank in
                            NavigationLink(destination: QuestionBankDetailView(bank: bank)) {
                                QuestionBankRow(bank: bank)
                            }
                        }
                    }
                    .refreshable {
                        loadQuestionBanks()
                    }
                }
            }
            .navigationTitle("Question Banks")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        loadQuestionBanks()
                    }) {
                        Image(systemName: "arrow.clockwise")
                    }
                }
            }
            .onAppear {
                loadQuestionBanks()
            }
        }
    }
    
    private func loadQuestionBanks() {
        isLoading = true
        errorMessage = nil
        needLogin = false
        
        // Create a request
        let queryRequest = QuestionBankQueryRequest(
            current: String(currentPage),
            pageSize: String(pageSize),
            sortField: "createTime",
            sortOrder: "descend"
        )
        
        // Call the API
        QuestionBankControllerAPI.listQuestionBankByPageUsingPOST(
            questionBankQueryRequest: queryRequest
        ) { response, error in
            isLoading = false
            
            if let error = error {
                errorMessage = "API Error: \(error.localizedDescription)"
                return
            }
            
            // 检查是否是未登录错误
            if let code = response?.code, code == 40100 {
                needLogin = true
                errorMessage = "Please login first"
                return
            }
            
            if let responseData = response?.data {
                if let records = responseData.records {
                    self.questionBanks = records
                } else {
                    self.questionBanks = []
                }
            } else {
                errorMessage = "No data in response"
            }
        }
    }
}

struct QuestionBankRow: View {
    let bank: QuestionBank
    @State private var imageURL: URL?
    
    var body: some View {
        HStack(spacing: 12) {
            // 题库图片，使用缓存
            CachedAsyncImage(url: getImageURL()) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                        .frame(width: 80, height: 80)
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(8)
                case .success(let image):
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 80, height: 80)
                        .cornerRadius(8)
                        .clipped()
                case .failure:
                    Image(systemName: "photo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding(20)
                        .frame(width: 80, height: 80)
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(8)
                @unknown default:
                    EmptyView()
                }
            }
            .frame(width: 80, height: 80)
            
            // 题库信息
            VStack(alignment: .leading, spacing: 8) {
                Text(bank.title ?? "Untitled")
                    .font(.headline)
                    .lineLimit(1)
                
                if let description = bank.description, !description.isEmpty {
                    Text(description)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .lineLimit(2)
                }
                
                HStack {
                    if let createdTime = bank.createTime {
                        Text("Created: \(formattedDate(createdTime))")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                    
                    Spacer()
                    
                    Text("ID: \(bank.id ?? "")")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
            }
        }
        .padding(.vertical, 8)
    }
    
    private func getImageURL() -> URL? {
        guard let pictureString = bank.picture, !pictureString.isEmpty else {
            return nil
        }
        
        // 检查 picture 是否已经是完整的 URL
        if pictureString.lowercased().hasPrefix("http://") || pictureString.lowercased().hasPrefix("https://") {
            return URL(string: pictureString)
        }
        
        // 否则，拼接 API 基础 URL
        return URL(string: "\(LearnForumAPIClientAPI.basePath)/\(pictureString)")
    }
    
    private func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter.string(from: date)
    }
}

// 题库详情视图
struct QuestionBankDetailView: View {
    let bank: QuestionBank
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                CachedAsyncImage(url: getImageURL()) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                            .frame(height: 200)
                            .frame(maxWidth: .infinity)
                            .background(Color.gray.opacity(0.1))
                            .cornerRadius(12)
                    case .success(let image):
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(height: 200)
                            .frame(maxWidth: .infinity)
                            .cornerRadius(12)
                            .clipped()
                    case .failure:
                        VStack {
                            Image(systemName: "photo")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 60, height: 60)
                            
                            Text("Image Loading Failed")
                                .foregroundColor(.gray)
                        }
                        .frame(height: 200)
                        .frame(maxWidth: .infinity)
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(12)
                    @unknown default:
                        EmptyView()
                    }
                }
                .padding(.horizontal)
                
                // 题库详细信息
                VStack(alignment: .leading, spacing: 12) {
                    Text(bank.title ?? "Untitled")
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    if let description = bank.description, !description.isEmpty {
                        Text(description)
                            .font(.body)
                            .foregroundColor(.secondary)
                    }
                    
                    // 查看题库问题按钮
                    NavigationLink(destination: QuestionListView(questionBank: bank)) {
                        HStack {
                            Image(systemName: "list.bullet")
                            Text("View All Questions")
                            Spacer()
                            Image(systemName: "chevron.right")
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                    }
                    .buttonStyle(PlainButtonStyle())
                    .padding(.vertical, 8)
                    
                    Divider()
                    
                    // 题库元数据
                    Group {
                        HStack {
                            Text("ID:")
                                .fontWeight(.semibold)
                            Text(bank.id ?? "Unknown")
                            Spacer()
                        }
                        
                        if let createdTime = bank.createTime {
                            HStack {
                                Text("Created:")
                                    .fontWeight(.semibold)
                                Text(formattedDate(createdTime, withTime: true))
                                Spacer()
                            }
                        }
                        
                        if let updateTime = bank.updateTime {
                            HStack {
                                Text("Updated:")
                                    .fontWeight(.semibold)
                                Text(formattedDate(updateTime, withTime: true))
                                Spacer()
                            }
                        }
                        
                        if let priority = bank.priority {
                            HStack {
                                Text("Priority:")
                                    .fontWeight(.semibold)
                                Text("\(priority)")
                                Spacer()
                            }
                        }
                    }
                    .font(.subheadline)
                    
                    Divider()
                    
                    // 图片路径信息
                    if let pictureString = bank.picture, !pictureString.isEmpty {
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Image Path Information")
                                .font(.headline)
                                .foregroundColor(.gray)
                            
                            Text("Original Path: \(pictureString)")
                                .font(.caption)
                                .foregroundColor(.secondary)
                            
                            if let fullURL = getImageURL() {
                                Text("Full URL: \(fullURL.absoluteString)")
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                            }
                        }
                        .padding()
                        .background(Color.gray.opacity(0.05))
                        .cornerRadius(8)
                    }
                }
                .padding()
            }
        }
        .navigationTitle("Question Bank Details")
    }
    
    private func getImageURL() -> URL? {
        guard let pictureString = bank.picture, !pictureString.isEmpty else {
            return nil
        }
        
        // 检查 picture 是否已经是完整的 URL
        if pictureString.lowercased().hasPrefix("http://") || pictureString.lowercased().hasPrefix("https://") {
            return URL(string: pictureString)
        }
        
        // 否则，拼接 API 基础 URL
        return URL(string: "\(LearnForumAPIClientAPI.basePath)/\(pictureString)")
    }
    
    private func formattedDate(_ date: Date, withTime: Bool = false) -> String {
        let formatter = DateFormatter()
        if withTime {
            formatter.dateStyle = .short
            formatter.timeStyle = .short
        } else {
            formatter.dateStyle = .short
        }
        return formatter.string(from: date)
    }
}

#Preview {
    QuestionBankView()
}

// 题库详情页的预览
#Preview("Question Bank Details") {
    NavigationView {
        QuestionBankDetailView(bank: QuestionBank(
            createTime: Date(),
            description: "This is a test question bank description with more details about the question bank to help users understand its content and purpose.",
            id: "1001",
            picture: "https://picsum.photos/800/600", 
            priority: 1,
            title: "Example Question Bank",
            updateTime: Date(),
            userId: "user123"
        ))
    }
} 