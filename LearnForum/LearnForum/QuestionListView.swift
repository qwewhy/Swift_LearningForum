//
//  QuestionListView.swift
//  LearnForum
//
//  Created by Jingyu on 2025/5/11.
//

import SwiftUI
import LearnForumAPIClient

struct QuestionListView: View {
    let questionBankId: String
    @State private var questions: [QuestionBankQuestion] = []
    @State private var isLoading = false
    @State private var errorMessage: String? = nil

    var body: some View {
        VStack {
            if isLoading {
                ProgressView("加载中...")
                    .padding()
            } else if let error = errorMessage {
                Text("错误：\(error)")
                    .foregroundColor(.red)
                    .padding()
            } else if questions.isEmpty {
                Text("当前题库暂无题目")
                    .foregroundColor(.gray)
                    .padding()
            } else {
                List(questions, id: \.id) { q in
                    VStack(alignment: .leading, spacing: 4) {
                        Text("题目 ID: \(q.id ?? 0)")
                            .font(.headline)
                        Text("题目编号: \(q.questionId ?? 0)")
                            .font(.subheadline)
                    }
                    .padding(.vertical, 6)
                }
            }
        }
        .navigationTitle("题库内容")
        .onAppear {
            loadQuestions()
        }
    }

    private func loadQuestions() {
        isLoading = true
        errorMessage = nil
        
        guard let id = Int64(questionBankId) else {
            errorMessage = "题库id无效"
            return
        }

        let request = QuestionBankQuestionQueryRequest(
            current: 1,
            pageSize: 20,
            questionBankId: id,
            sortField: "createTime",
            sortOrder: "descend"
        )

        QuestionBankQuestionControllerAPI.listQuestionBankQuestionByPageUsingPOST(questionBankQuestionQueryRequest: request) { response, error in
            isLoading = false

            if let error = error {
                errorMessage = "请求失败：\(error.localizedDescription)"
                print("错误信息:" , error)
                return
            }
            
            guard response?.code == 0 else {
                errorMessage = "接口返回错误：\(response?.message ?? "未知错误")"
                return
            }
            
            /*
            if response?.code != 0 {
                errorMessage = "接口返回错误：\(response?.message ?? "未知错误")"
                return
            }
             */

            questions = response?.data?.records ?? []
        }
    }
}

#Preview {
    QuestionListView(questionBankId: "61") // 示例 ID
}
