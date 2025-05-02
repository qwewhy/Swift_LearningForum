//
//  BrowseQuestionsView.swift
//  LearnForum
//
//  Created by Yanao Kong on 1/5/2025.
//

import SwiftUI

struct BrowseQuestionsView: View {
    @StateObject private var viewModel = BrowseQuestionsViewModel()
    @State private var searchText = ""
    
    var body: some View {
        NavigationView {
            VStack {
                // Search bar
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                    TextField("Search questions", text: $searchText)
                        .onSubmit {
                            viewModel.searchQuestions(searchText)
                        }
                    if !searchText.isEmpty {
                        Button(action: {
                            searchText = ""
                            viewModel.loadQuestions()
                        }) {
                            Image(systemName: "xmark.circle.fill")
                                .foregroundColor(.gray)
                        }
                    }
                }
                .padding(8)
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .padding(.horizontal)
                
                if viewModel.isLoading {
                    Spacer()
                    ProgressView()
                    Spacer()
                } else if viewModel.questions.isEmpty {
                    Spacer()
                    Text("No questions found")
                    Spacer()
                } else {
                    List {
                        ForEach(viewModel.questions, id: \.id) { question in
                            NavigationLink(destination: QuestionDetailView(questionId: question.id ?? 0)) {
                                QuestionRow(question: question)
                            }
                        }
                        
                        if viewModel.hasMoreData {
                            ProgressView()
                                .onAppear {
                                    viewModel.loadMoreQuestions()
                                }
                        }
                    }
                }
            }
            .navigationTitle("Questions")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: AddQuestionView(onQuestionAdded: { _ in
                        viewModel.loadQuestions()
                    })) {
                        Image(systemName: "plus")
                    }
                }
            }
            .onAppear {
                viewModel.loadQuestions()
            }
        }
    }
}
