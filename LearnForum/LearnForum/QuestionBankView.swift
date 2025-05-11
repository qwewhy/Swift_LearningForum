import SwiftUI
import LearnForumAPIClient

struct QuestionBankView: View {
    @State private var questionBanks: [QuestionBank] = []
    @State private var isLoading = false
    @State private var errorMessage: String? = nil
    @State private var currentPage = 1
    @State private var pageSize = 10
    @State private var responseDebugInfo: String = ""
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
                        Text("请先登录")
                            .font(.title)
                            .padding()
                        
                        Text("您需要登录后才能查看题库")
                            .foregroundColor(.gray)
                            .padding()
                        
                        Button("返回登录") {
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
                        Text("发生错误")
                            .font(.title)
                            .foregroundColor(.red)
                            .padding()
                        
                        Text(error)
                            .foregroundColor(.gray)
                            .padding()
                        
                        if !responseDebugInfo.isEmpty {
                            Text("调试信息:")
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
                        
                        Button("重试") {
                            loadQuestionBanks()
                        }
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                    }
                } else if questionBanks.isEmpty {
                    VStack {
                        Text("未找到题库")
                            .font(.title2)
                            .foregroundColor(.gray)
                            .padding()
                        
                        if !responseDebugInfo.isEmpty {
                            Text("调试信息:")
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
                        
                        Button("刷新") {
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
                            if let id = bank.id {
                                NavigationLink(destination: BankQuestionListView(questionBankId: id)) {
                                    QuestionBankRow(bank: bank)
                                }
                            }
                        }
                    }
                    .refreshable {
                        loadQuestionBanks()
                    }
                }
            }
            .navigationTitle("题库")
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
        needLogin = false
        
        print("开始请求API: \(LearnForumAPIClientAPI.basePath)/api/questionBank/list/page")
        
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
                errorMessage = "API错误: \(error.localizedDescription)"
                print("错误: \(error)")
                responseDebugInfo = "错误详情: \(error)"
                return
            }
            
            print("API返回状态: \(response?.code ?? -1), 消息: \(response?.message ?? "无消息")")
            responseDebugInfo += "状态码: \(response?.code ?? -1)\n"
            responseDebugInfo += "消息: \(response?.message ?? "无消息")\n"
            
            // 检查是否是未登录错误
            if let code = response?.code, code == 40100 {
                needLogin = true
                errorMessage = "请先登录"
                return
            }
            
            if let responseData = response?.data {
                responseDebugInfo += "返回数据: 存在\n"
                
                if let records = responseData.records {
                    self.questionBanks = records
                    print("加载了 \(records.count) 个题库")
                    responseDebugInfo += "记录数: \(records.count)\n"
                    
                    if records.isEmpty {
                        responseDebugInfo += "记录为空\n"
                    } else {
                        // 打印第一条记录的内容
                        if let firstRecord = records.first {
                            responseDebugInfo += "第一条记录:\n"
                            responseDebugInfo += "- ID: \(firstRecord.id ?? "无")\n"
                            responseDebugInfo += "- 标题: \(firstRecord.title ?? "无标题")\n"
                            responseDebugInfo += "- 描述: \(firstRecord.description ?? "无描述")\n"
                        }
                    }
                } else {
                    self.questionBanks = []
                    print("响应数据中没有记录")
                    responseDebugInfo += "records 字段为空\n"
                    
                    // 输出完整的响应数据结构
                    responseDebugInfo += "分页信息:\n"
                    responseDebugInfo += "- total: \(responseData.total ?? "")\n"
                    responseDebugInfo += "- pages: \(responseData.pages ?? "")\n"
                    responseDebugInfo += "- current: \(responseData.current ?? "")\n"
                    responseDebugInfo += "- size: \(responseData.size ?? "")\n"
                }
            } else {
                errorMessage = "响应中无数据"
                print("响应中无数据")
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
            Text(bank.title ?? "未命名")
                .font(.headline)
            
            if let description = bank.description, !description.isEmpty {
                Text(description)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .lineLimit(2)
            }
            
            HStack {
                if let createdTime = bank.createTime {
                    Text("创建时间: \(formattedDate(createdTime))")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                
                Spacer()
                
                Text("ID: \(bank.id ?? "")")
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
