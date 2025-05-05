import SwiftUI
import LearnForumAPIClient

struct QuestionBankView: View {
    @State private var questionBanks: [QuestionBank] = []
    @State private var isLoading = false
    @State private var errorMessage: String? = nil
    @State private var currentPage = 1
    @State private var pageSize = 10
    @State private var responseDebugInfo: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                if isLoading {
                    ProgressView()
                        .scaleEffect(1.5)
                        .padding()
                } else if let error = errorMessage {
                    VStack {
                        Text("Error occurred")
                            .font(.title)
                            .foregroundColor(.red)
                            .padding()
                        
                        Text(error)
                            .foregroundColor(.gray)
                            .padding()
                        
                        if !responseDebugInfo.isEmpty {
                            Text("Debug Info:")
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
                        Text("No question banks found")
                            .font(.title2)
                            .foregroundColor(.gray)
                            .padding()
                        
                        if !responseDebugInfo.isEmpty {
                            Text("Debug Info:")
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
                            QuestionBankRow(bank: bank)
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
        responseDebugInfo = ""
        
        print("开始请求API: \(LearnForumAPIClientAPI.basePath)/api/questionBank/list/page")
        
        // Create a request
        let queryRequest = QuestionBankQueryRequest(
            current: currentPage,
            pageSize: pageSize,
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
                print("Error: \(error)")
                responseDebugInfo = "错误详情: \(error)"
                return
            }
            
            print("API返回状态: \(response?.code ?? -1), 消息: \(response?.message ?? "无消息")")
            responseDebugInfo += "状态码: \(response?.code ?? -1)\n"
            responseDebugInfo += "消息: \(response?.message ?? "无消息")\n"
            
            if let responseData = response?.data {
                responseDebugInfo += "返回数据: 存在\n"
                
                if let records = responseData.records {
                    self.questionBanks = records
                    print("Loaded \(records.count) question banks")
                    responseDebugInfo += "记录数: \(records.count)\n"
                    
                    if records.isEmpty {
                        responseDebugInfo += "记录为空\n"
                    } else {
                        // 打印第一条记录的内容
                        if let firstRecord = records.first {
                            responseDebugInfo += "第一条记录:\n"
                            responseDebugInfo += "- ID: \(firstRecord.id ?? 0)\n"
                            responseDebugInfo += "- 标题: \(firstRecord.title ?? "无标题")\n"
                            responseDebugInfo += "- 描述: \(firstRecord.description ?? "无描述")\n"
                        }
                    }
                } else {
                    self.questionBanks = []
                    print("No records in response data")
                    responseDebugInfo += "records 字段为空\n"
                    
                    // 输出完整的响应数据结构
                    responseDebugInfo += "分页信息:\n"
                    responseDebugInfo += "- total: \(responseData.total ?? 0)\n"
                    responseDebugInfo += "- pages: \(responseData.pages ?? 0)\n"
                    responseDebugInfo += "- current: \(responseData.current ?? 0)\n"
                    responseDebugInfo += "- size: \(responseData.size ?? 0)\n"
                }
            } else {
                errorMessage = "No data in response"
                print("No data in response")
                responseDebugInfo += "response.data 为 nil\n"
                
                // 输出完整的响应对象内容
                var fullResponseInfo = "完整响应信息:\n"
                if let response = response {
                    fullResponseInfo += "Response 对象存在\n"
                    fullResponseInfo += "- code: \(response.code ?? -1)\n"
                    fullResponseInfo += "- message: \(response.message ?? "无")\n"
                    fullResponseInfo += "- data: nil\n"
                } else {
                    fullResponseInfo += "Response 对象为 nil\n"
                }
                responseDebugInfo += fullResponseInfo
                
                print(fullResponseInfo)
            }
        }
    }
}

struct QuestionBankRow: View {
    let bank: QuestionBank
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(bank.title ?? "Untitled")
                .font(.headline)
            
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
                
                Text("ID: \(bank.id ?? 0)")
                    .font(.caption)
                    .foregroundColor(.secondary)
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

#Preview {
    QuestionBankView()
} 