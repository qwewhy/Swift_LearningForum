import SwiftUI
import LearnForumAPIClient

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

// Helper function to safely convert ID types
private func safelyGetPostId(_ id: Any?) -> Int64? {
    if let intId = id as? Int64 {
        return intId
    } else if let stringId = id as? String, let intId = Int64(stringId) {
        return intId
    }
    return nil
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
            // 标签视图
            TagsView(tagList: question.tagList)
            
            // 元数据视图
            MetadataView(question: question)
            
            // 问题内容 - 移动到这里，放在元数据下方
            if let content = question.content {
                ContentSectionView(content: content)
            }
            
            // 评论视图 - 添加在内容和答案之间
            if let questionId = question.id {
                // Convert String ID to Int64 if needed
                if let intId = Int64(questionId) {
                    CommentView(questionId: intId)
                } else if let intId = questionId as? Int64 {
                    CommentView(questionId: intId)
                } else {
                    // Fallback if conversion fails
                    Text("Cannot load comments: Invalid question ID format")
                        .foregroundColor(.red)
                        .padding()
                }
            }
            
            // 答案视图
            AnswerView(answer: question.answer, showAnswer: $showAnswer)
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
    let userId: Any?
    
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
                    Text(String(describing: userId))
                }
                .font(.caption)
                .foregroundColor(.secondary)
            }
        }
    }
}

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

// Comment Views
struct CommentView: View {
    let questionId: Int64
    
    @State private var comments: [PostVO] = []
    @State private var newComment: String = ""
    @State private var isLoading = false
    @State private var errorMessage: String? = nil
    @State private var showAddComment = false
    @State private var currentPage = 1
    @State private var pageSize = 10
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Text("Comments")
                    .font(.headline)
                    .foregroundColor(.secondary)
                
                Spacer()
                
                Button {
                    showAddComment.toggle()
                } label: {
                    Label("Add Comment", systemImage: "plus.bubble")
                        .font(.caption)
                }
            }
            
            if showAddComment {
                AddCommentView(
                    questionId: questionId,
                    newComment: $newComment,
                    onSubmit: submitComment,
                    onCancel: { showAddComment = false }
                )
            }
            
            if isLoading {
                ProgressView()
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding()
            } else if let error = errorMessage {
                Text(error)
                    .foregroundColor(.red)
                    .padding()
            } else if comments.isEmpty {
                Text("No comments yet. Be the first to comment!")
                    .foregroundColor(.gray)
                    .italic()
                    .padding()
            } else {
                CommentListView(comments: comments)
            }
            
            Button {
                loadComments()
            } label: {
                Label("Refresh Comments", systemImage: "arrow.clockwise")
                    .font(.caption)
                    .frame(maxWidth: .infinity, alignment: .center)
            }
            .padding(.top, 8)
        }
        .padding()
        .background(Color.gray.opacity(0.05))
        .cornerRadius(8)
        .onAppear(perform: loadComments)
    }
    
    private func loadComments() {
        isLoading = true
        errorMessage = nil
        
        let queryRequest = PostQueryRequest(
            content: nil,
            current: currentPage,
            favourUserId: nil,
            id: nil,
            notId: nil,
            orTags: nil,
            pageSize: pageSize,
            searchText: nil,
            sortField: "createTime",
            sortOrder: "descend",
            tags: [String(questionId)],
            title: nil,
            userId: nil
        )
        
        // Call the API to fetch comments
        PostControllerAPI.listPostVOByPageUsingPOST(postQueryRequest: queryRequest) { response, error in
            isLoading = false
            
            if let error = error {
                errorMessage = "Error loading comments: \(error.localizedDescription)"
                return
            }
            
            if let code = response?.code, code == 40100 {
                errorMessage = "Please login to view comments"
                return
            }
            
            if let responseData = response?.data {
                if let records = responseData.records {
                    comments = records
                } else {
                    comments = []
                }
            } else {
                errorMessage = "No comment data in response"
            }
        }
    }
    
    private func submitComment() {
        guard !newComment.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
            errorMessage = "Comment cannot be empty"
            return
        }
        
        isLoading = true
        errorMessage = nil
        
        let postAddRequest = PostAddRequest(
            content: newComment,
            tags: [String(questionId)],  // Add the questionId as a tag to associate with the question
            title: "Comment on Question #\(questionId)"
        )
        
        // Call the API to add a comment
        PostControllerAPI.addPostUsingPOST(postAddRequest: postAddRequest) { response, error in
            isLoading = false
            
            if let error = error {
                errorMessage = "Error posting comment: \(error.localizedDescription)"
                return
            }
            
            if let code = response?.code, code == 40100 {
                errorMessage = "Please login to post comments"
                return
            }
            
            if let code = response?.code, code != 0 {
                errorMessage = response?.message ?? "Failed to post comment"
                return
            }
            
            // Comment posted successfully
            newComment = ""
            showAddComment = false
            loadComments() // Reload comments to show the new one
        }
    }
}

struct AddCommentView: View {
    let questionId: Int64
    @Binding var newComment: String
    let onSubmit: () -> Void
    let onCancel: () -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Add a Comment")
                .font(.subheadline)
                .fontWeight(.medium)
            
            TextEditor(text: $newComment)
                .frame(minHeight: 80)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                )
                .padding(.bottom, 4)
            
            HStack {
                Button(action: onCancel) {
                    Text("Cancel")
                        .foregroundColor(.red)
                }
                
                Spacer()
                
                Button(action: onSubmit) {
                    Text("Post Comment")
                        .fontWeight(.medium)
                }
                .disabled(newComment.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
            }
        }
        .padding()
        .background(Color.gray.opacity(0.1))
        .cornerRadius(8)
    }
}

struct CommentListView: View {
    let comments: [PostVO]
    
    var body: some View {
        VStack(spacing: 12) {
            ForEach(comments, id: \.id) { comment in
                CommentItemView(comment: comment)
            }
        }
    }
}

struct CommentItemView: View {
    let comment: PostVO
    
    // Track liked state
    @State private var isLiked: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                if let user = comment.user, let userName = user.userName, !userName.isEmpty {
                    Text(userName)
                        .font(.subheadline)
                        .fontWeight(.medium)
                } else {
                    Text("Johnny")
                        .font(.subheadline)
                        .fontWeight(.medium)
                }
                
                Spacer()
                
                if let createTime = comment.createTime {
                    Text(formattedDate(createTime, withTime: true))
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
            }
            
            if let content = comment.content {
                Text(content)
                    .font(.body)
                    .padding(.vertical, 4)
            }
            
            HStack {
                Spacer()
                
                // Like/dislike button
                Button {
                    toggleLikeComment()
                } label: {
                    HStack(spacing: 4) {
                        Image(systemName: isLiked ? "hand.thumbsup.fill" : "hand.thumbsup")
                            .foregroundColor(isLiked ? .blue : .gray)
                        
                        Text("\(comment.thumbNum ?? 0)")
                            .font(.caption)
                            .foregroundColor(isLiked ? .blue : .gray)
                    }
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(12)
                }
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(8)
        .shadow(color: Color.black.opacity(0.05), radius: 2, x: 0, y: 1)
    }
    
    private func toggleLikeComment() {
        guard let postId = safelyGetPostId(comment.id) else {
            print("Cannot process like: Invalid post ID")
            return
        }
        
        isLiked.toggle()
        
        let postIdString = String(postId)
        
        let thumbRequest = PostThumbAddRequest(postId: postIdString)
        
        PostThumbControllerAPI.doThumbUsingPOST(postThumbAddRequest: thumbRequest) { response, error in
            if error != nil || (response?.code ?? -1) != 0 {
                DispatchQueue.main.async {
                    self.isLiked.toggle()
                }
            }
        }
    }
}

#Preview {
    NavigationView {
        QuestionDetailView(questionId: 1001)
    }
}
