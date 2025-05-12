//
//  AskQuestionView.swift
//  LearnForum
//
//  Created by Jingyu on 2025/5/11.
//

import SwiftUI
import LearnForumAPIClient

struct AskQuestionView: View {
    @State private var searchText = ""
    @State private var questions: [QuestionVO] = []
    @State private var isLoading = false
    @State private var errorMessage: String? = nil
    
    var body: some View {
        VStack(spacing: 0) {
            // Search header
            VStack(spacing: 16) {
                HStack {
                    TextField("Enter search text", text: $searchText)
                        .padding(10)
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(8)
                    
                    Button(action: searchQuestions) {
                        Text("Search")
                            .padding(.horizontal, 16)
                            .padding(.vertical, 10)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                }
            }
            .padding()
            .background(Color.white)
            
            // Results area
            ZStack {
                if isLoading {
                    ProgressView("Searching...")
                        .scaleEffect(1.2)
                        .padding()
                } else if let error = errorMessage {
                    VStack(spacing: 16) {
                        Image(systemName: "exclamationmark.triangle")
                            .font(.largeTitle)
                            .foregroundColor(.orange)
                        
                        Text("Error: \(error)")
                            .multilineTextAlignment(.center)
                        
                        Button("Try Again") {
                            searchQuestions()
                        }
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                    }
                    .padding()
                } else if questions.isEmpty {
                    VStack(spacing: 16) {
                        Image(systemName: "magnifyingglass")
                            .font(.largeTitle)
                            .foregroundColor(.gray)
                        
                        Text(searchText.isEmpty ? "Enter text to search for questions" : "No questions found matching '\(searchText)'")
                            .multilineTextAlignment(.center)
                            .foregroundColor(.gray)
                    }
                    .padding()
                } else {
                    List {
                        ForEach(questions, id: \.id) { question in
                            NavigationLink(destination: QuestionDetailView(questionId: Int64(question.id ?? "0"))) {
                                SearchQuestionRow(question: question)
                            }
                        }
                    }
                    .listStyle(PlainListStyle())
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .navigationTitle("Search Questions")
    }
    
    private func searchQuestions() {
        isLoading = true
        errorMessage = nil
        
        // Create request 
        let queryRequest = QuestionQueryRequest(
            answer: nil,
            content: nil,
            current: nil,
            id: nil,
            notId: nil, 
            pageSize: 40,
            questionBankId: nil,
            searchText: searchText,
            sortField: "createTime",
            sortOrder: "descend",
            tags: nil,
            title: nil,
            userId: nil
        )
        
        // Call the API
        QuestionControllerAPI.searchQuestionVOByPageUsingPOST(questionQueryRequest: queryRequest) { response, error in
            isLoading = false
            
            if let error = error {
                errorMessage = error.localizedDescription
                return
            }
            
            if let code = response?.code, code != 0 {
                errorMessage = response?.message ?? "Unknown error occurred"
                return
            }
            
            if let responseData = response?.data, let records = responseData.records {
                self.questions = records
            } else {
                self.questions = []
            }
        }
    }
}

struct SearchQuestionRow: View {
    let question: QuestionVO
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(question.title ?? "Untitled")
                .font(.headline)
                .lineLimit(2)
            
            if let content = question.content, !content.isEmpty {
                Text(content)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .lineLimit(3)
            }
            
            HStack {
                if let createTime = question.createTime {
                    Text(formatDate(createTime))
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                
                Spacer()
            }
        }
        .padding(.vertical, 8)
    }
    
    private func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter.string(from: date)
    }
}

#Preview {
    AskQuestionView()
}
