//
//  QuestionListView.swift
//  LearnForum
//
//  Created by Jingyu on 2025/5/11.
//

import SwiftUI
import LearnForumAPIClient

struct QuestionListView: View {
    let questionBankId: Int64

    @State private var questions: [Question] = []
    @State private var isLoading = false
    @State private var errorMessage: String?
    @State private var expandedQuestionId: Int64?

    var body: some View {
        NavigationView {
            Group {
                if isLoading {
                    ProgressView("加载题目中…")
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
                else if let error = errorMessage {
                    Text("加载失败：\(error)")
                        .foregroundColor(.red)
                        .padding()
                }
                else if questions.isEmpty {
                    Text("当前题库暂无题目")
                        .foregroundColor(.gray)
                        .padding()
                }
                else {
                    List(questions, id: \.id) { question in
                        VStack(alignment: .leading, spacing: 8) {
                            Text(question.content ?? "无内容")
                                .font(.headline)
                                .fixedSize(horizontal: false, vertical: true)

                            Text("创建时间：\(formattedDate(question.createTime))")
                                .font(.subheadline)
                                .foregroundColor(.gray)

                            if expandedQuestionId == question.id {
                                Text("答案：\(question.answer ?? "无答案")")
                                    .font(.body)
                                    .foregroundColor(.green)
                            }

                            Button {
                                expandedQuestionId = (expandedQuestionId == question.id ? nil : question.id)
                            } label: {
                                Text(expandedQuestionId == question.id ? "隐藏答案" : "查看答案")
                                    .font(.footnote)
                                    .foregroundColor(.blue)
                            }
                        }
                        .padding(.vertical, 6)
                    }
                }
            }
            .navigationTitle("题库详情")
        }
        .onAppear { fetchQuestions() }
    }

    private func fetchQuestions() {
        isLoading = true
        errorMessage = nil

        var query = QuestionQueryRequest()
        query.questionBankId = questionBankId
        query.current = 1      // 正确的分页字段
        query.pageSize = 50

        QuestionControllerAPI
            .listQuestionByPageUsingPOST(questionQueryRequest: query) { resp, err in
                DispatchQueue.main.async {
                    isLoading = false
                    if let err = err {
                        errorMessage = err.localizedDescription
                    } else {
                        questions = resp?.data?.records ?? []
                    }
                }
            }
    }

    private func formattedDate(_ date: Date?) -> String {
        guard let date = date else { return "未知时间" }
        let f = DateFormatter()
        f.dateStyle = .medium
        f.timeStyle = .short
        return f.string(from: date)
    }
}


struct QuestionListView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionListView(questionBankId: 1)
    }
}
