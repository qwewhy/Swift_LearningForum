//
//  BankQuestionListView.swift
//  LearnForum
//
//  Created by Jingyu on 2025/5/11.
//

import SwiftUI
import LearnForumAPIClient


struct BankQuestionListView: View {
    let questionBankId: String

    @State private var questions: [Question] = []
    @State private var isLoading = false
    @State private var errorMessage: String?

    var body: some View {
        List {
            if isLoading {
                HStack { Spacer(); ProgressView("加载题目列表…"); Spacer() }
            }
            else if let err = errorMessage {
                Text("加载失败：\(err)")
                    .foregroundColor(.red)
                    .multilineTextAlignment(.center)
            }
            else {
                ForEach(questions, id: \.id) { (q: Question) in
                    NavigationLink {
                        QuestionDetailView(questionId: q.id ?? 0)
                    } label: {
                        VStack(alignment: .leading, spacing: 4) {
                            Text(q.content ?? "无内容")
                                .lineLimit(2)
                                .font(.headline)
                            Text("创建：\(formattedDate(q.createTime))")
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                        .padding(.vertical, 4)
                    }
                }
            }
        }
        .navigationTitle("题目列表")
        .onAppear(perform: loadQuestions)
    }

    private func loadQuestions() {
        isLoading = true
        errorMessage = nil

        var req = QuestionQueryRequest()
        req.questionBankId = questionBankId
        req.current         = 1
        req.pageSize        = 50

        QuestionControllerAPI
            .listQuestionByPageUsingPOST(questionQueryRequest: req) { resp, err in
                DispatchQueue.main.async {
                    isLoading = false
                    if let e = err {
                        errorMessage = e.localizedDescription
                    } else {
                        questions = resp?.data?.records ?? []
                    }
                }
            }
    }

    private func formattedDate(_ d: Date?) -> String {
        guard let d = d else { return "--" }
        let f = DateFormatter()
        f.dateStyle = .short
        return f.string(from: d)
    }
}
