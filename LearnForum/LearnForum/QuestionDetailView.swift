import SwiftUI
import LearnForumAPIClient

// 公共日期格式化函数
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

struct QuestionDetailView: View {
    let questionId: Int64?
    
    @State private var question: QuestionVO?
    @State private var isLoading = false
    @State private var errorMessage: String? = nil
    @State private var needLogin = false
    @State private var showAnswer = false
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                if isLoading {
                    LoadingView()
                } else if needLogin {
                    LoginPromptView()
                } else if let error = errorMessage {
                    ErrorView(error: error, retryAction: loadQuestionDetail)
                } else if let question = question {
                    QuestionContentView(question: question, showAnswer: $showAnswer)
                } else {
                    EmptyStateView(reloadAction: loadQuestionDetail)
                }
            }
        }
        .navigationTitle("Question Details")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: loadQuestionDetail) {
                    Image(systemName: "arrow.clockwise")
                }
            }
        }
        .onAppear(perform: loadQuestionDetail)
    }
    
    private func loadQuestionDetail() {
        guard let questionId = questionId else {
            errorMessage = "Question ID cannot be empty"
            return
        }
        
        isLoading = true
        errorMessage = nil
        needLogin = false
        
        // 调用API
        QuestionControllerAPI.getQuestionVOByIdUsingGET(id: questionId) { response, error in
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
            
            if let questionData = response?.data {
                self.question = questionData
            } else {
                errorMessage = "No data in response"
            }
        }
    }
}


// 加载状态视图
struct LoadingView: View {
    var body: some View {
        HStack {
            Spacer()
            ProgressView()
                .scaleEffect(1.5)
                .padding()
            Spacer()
        }
    }
}

// 登录提示视图
struct LoginPromptView: View {
    var body: some View {
        VStack {
            Text("Please Login")
                .font(.title)
                .padding()
            
            Text("You need to login to view question details")
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
        .frame(maxWidth: .infinity)
    }
}

// 错误信息视图
struct ErrorView: View {
    let error: String
    let retryAction: () -> Void
    
    var body: some View {
        VStack {
            Text("Error Occurred")
                .font(.title)
                .foregroundColor(.red)
                .padding()
            
            Text(error)
                .foregroundColor(.gray)
                .padding()
            
            Button("Retry", action: retryAction)
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(8)
        }
        .frame(maxWidth: .infinity)
    }
}

// 空状态视图
struct EmptyStateView: View {
    let reloadAction: () -> Void
    
    var body: some View {
        VStack {
            Text("Question Not Found")
                .font(.title2)
                .foregroundColor(.gray)
                .padding()
            
            Button("Refresh", action: reloadAction)
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(8)
        }
        .frame(maxWidth: .infinity)
    }
}

// 问题内容视图
struct QuestionContentView: View {
    let question: QuestionVO
    @Binding var showAnswer: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            // 标题
            if let title = question.title {
                Text(title)
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.bottom, 4)
            }
            
            QuestionBodyView(question: question, showAnswer: $showAnswer)
        }
        .padding()
    }
}

// 问题正文视图
struct QuestionBodyView: View {
    let question: QuestionVO
    @Binding var showAnswer: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            // 问题内容
            if let content = question.content {
                ContentSectionView(content: content)
            }
            
            // 标签视图
            TagsView(tagList: question.tagList)
            
            // 答案视图
            AnswerView(answer: question.answer, showAnswer: $showAnswer)
            
            // 元数据视图
            MetadataView(question: question)
        }
    }
}

// 内容部分视图
struct ContentSectionView: View {
    let content: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Question Content")
                .font(.headline)
                .foregroundColor(.secondary)
            
            Text(content)
                .font(.body)
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.gray.opacity(0.1))
        .cornerRadius(8)
    }
}

// 标签视图
struct TagsView: View {
    let tagList: [String]?
    
    var body: some View {
        if let tagList = tagList, !tagList.isEmpty {
            VStack(alignment: .leading, spacing: 8) {
                Text("Tags")
                    .font(.headline)
                    .foregroundColor(.secondary)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(tagList, id: \.self) { tag in
                            Text(tag)
                                .font(.caption)
                                .padding(.horizontal, 10)
                                .padding(.vertical, 5)
                                .background(Color.blue.opacity(0.2))
                                .foregroundColor(.blue)
                                .cornerRadius(12)
                        }
                    }
                }
            }
        }
    }
}

// 答案视图
struct AnswerView: View {
    let answer: String?
    @Binding var showAnswer: Bool
    
    var body: some View {
        if let answer = answer, !answer.isEmpty {
            VStack(alignment: .center, spacing: 8) {
                Button {
                    withAnimation {
                        showAnswer.toggle()
                    }
                } label: {
                    HStack {
                        Text(showAnswer ? "Hide Answer" : "Show Answer")
                        Image(systemName: showAnswer ? "chevron.up" : "chevron.down")
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
                }
                
                if showAnswer {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Answer")
                            .font(.headline)
                            .foregroundColor(.secondary)
                        
                        Text(answer)
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(Color.green.opacity(0.1))
                            .cornerRadius(8)
                    }
                    .padding(.top, 8)
                    .transition(.opacity)
                }
            }
            .padding(.vertical, 8)
        }
    }
}

// 元数据视图
struct MetadataView: View {
    let question: QuestionVO
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text("Question Information")
                .font(.headline)
                .foregroundColor(.secondary)
            
            Divider()
            
            // 用户信息
            UserInfoView(user: question.user, userId: question.userId)
            
            // 时间信息
            TimeInfoView(createTime: question.createTime, updateTime: question.updateTime)
        }
        .padding()
        .background(Color.gray.opacity(0.05))
        .cornerRadius(8)
    }
}

// 用户信息视图
struct UserInfoView: View {
    let user: UserVO?
    let userId: String?
    
    var body: some View {
        Group {
            if let user = user {
                HStack {
                    Label("Creator", systemImage: "person")
                    Text(user.userName ?? "Unknown User")
                }
                .font(.caption)
                .foregroundColor(.secondary)
            } else if let userId = userId {
                HStack {
                    Label("Creator ID", systemImage: "person")
                    Text(userId)
                }
                .font(.caption)
                .foregroundColor(.secondary)
            }
        }
    }
}

// 时间信息视图
struct TimeInfoView: View {
    let createTime: Date?
    let updateTime: Date?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            if let createTime = createTime {
                HStack {
                    Label("Created", systemImage: "calendar")
                    Text(formattedDate(createTime, withTime: true))
                }
                .font(.caption)
                .foregroundColor(.secondary)
                .padding(.top, 4)
            }
            
            if let updateTime = updateTime {
                HStack {
                    Label("Updated", systemImage: "clock")
                    Text(formattedDate(updateTime, withTime: true))
                }
                .font(.caption)
                .foregroundColor(.secondary)
                .padding(.top, 4)
            }
        }
    }
}

#Preview {
    NavigationView {
        QuestionDetailView(questionId: 1001)
    }
} 