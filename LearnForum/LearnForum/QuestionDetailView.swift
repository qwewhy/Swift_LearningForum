//
//  QuestionDetailView.swift
//  LearnForum
//
//  Created by Jingyu on 2025/5/11.
//


import SwiftUI
import LearnForumAPIClient

/// 单题详情页，接收 Int64的id
struct QuestionDetailView: View {
    let questionId: Int64  // 详情页用Int64

    @State private var question: QuestionVO?
    @State private var isLoading = false
    @State private var errorMessage: String?

    var body: some View {
        Group {
            if isLoading {
                ProgressView("加载题目…")
            }
            else if let err = errorMessage {
                Text("加载失败：\(err)")
                    .foregroundColor(.red)
            }
            else if let q = question {
                ScrollView {
                    VStack(alignment: .leading, spacing: 16) {
                        Text(q.content ?? "")
                            .font(.title2)
                        Text("答案：\(q.answer ?? "")")
                            .foregroundColor(.green)
                        // ！！！添加标签创建时间
                    }
                    .padding()
                }
            }
            else {
                Text("未获取到题目")
                    .foregroundColor(.gray)
            }
        }
        .navigationTitle("题目详情")
        .onAppear(perform: loadDetail)
    }

    private func loadDetail() {
        isLoading = true
        errorMessage = nil

        //用Int64
        QuestionControllerAPI
            .getQuestionVOByIdUsingGET(id: questionId) { resp, err in
                DispatchQueue.main.async {
                    isLoading = false
                    if let e = err {
                        errorMessage = e.localizedDescription
                    } else {
                        question = resp?.data
                    }
                }
            }
    }
}
