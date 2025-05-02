// Views/Questions/QuestionDetailView.swift
import SwiftUI

struct QuestionDetailView: View {
    let questionId: Int64
    
    @State private var question: QuestionVO?
    @State private var userAnswer: String = ""
    @State private var isLoading = true
    @State private var hasSubmitted = false
    @State private var isCorrect = false
    @State private var isSubmitting = false
    
    var body: some View {
        ScrollView {
            if isLoading {
                ProgressView()
                    .padding()
            } else if let question = question {
                VStack(alignment: .leading, spacing: 12) {
                    // Question section
                    VStack(alignment: .leading, spacing: 8) {
                        Text(question.title ?? "")
                            .font(.title)
                            .fontWeight(.bold)
                            .padding(.bottom, 4)
                        
                        if let content = question.content, !content.isEmpty {
                            Text(content)
                                .font(.body)
                                .padding(.bottom, 8)
                        }
                        
                        if let tagList = question.tagList, !tagList.isEmpty {
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack {
                                    ForEach(tagList, id: \.self) { tag in
                                        Text(tag)
                                            .font(.caption)
                                            .padding(.horizontal, 8)
                                            .padding(.vertical, 4)
                                            .background(Color.blue.opacity(0.1))
                                            .cornerRadius(4)
                                    }
                                }
                            }
                        }
                    }
                    .padding(.bottom, 20)
                    
                    // Answer input section (visible only before submission)
                    if !hasSubmitted {
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Your Answer:")
                                .font(.headline)
                            
                            TextEditor(text: $userAnswer)
                                .frame(minHeight: 120)
                                .padding(4)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 8)
                                        .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                                )
                            
                            Button(action: submitAnswer) {
                                if isSubmitting {
                                    ProgressView()
                                        .frame(maxWidth: .infinity)
                                        .padding()
                                        .background(Color.blue.opacity(0.7))
                                        .foregroundColor(.white)
                                        .cornerRadius(8)
                                } else {
                                    Text("Submit Answer")
                                        .frame(maxWidth: .infinity)
                                        .padding()
                                        .background(Color.blue)
                                        .foregroundColor(.white)
                                        .cornerRadius(8)
                                }
                            }
                            .disabled(userAnswer.isEmpty || isSubmitting)
                        }
                    }
                    
                    // Result section (visible only after submission)
                    if hasSubmitted {
                        VStack(alignment: .leading, spacing: 16) {
                            HStack {
                                Image(systemName: isCorrect ? "checkmark.circle.fill" : "xmark.circle.fill")
                                    .foregroundColor(isCorrect ? .green : .red)
                                    .font(.title)
                                
                                Text(isCorrect ? "Correct Answer!" : "Incorrect Answer")
                                    .font(.headline)
                                    .foregroundColor(isCorrect ? .green : .red)
                            }
                            
                            VStack(alignment: .leading, spacing: 8) {
                                Text("Your Answer:")
                                    .font(.headline)
                                    .foregroundColor(.gray)
                                
                                Text(userAnswer)
                                    .padding()
                                    .background(Color.gray.opacity(0.1))
                                    .cornerRadius(8)
                            }
                            
                            VStack(alignment: .leading, spacing: 8) {
                                Text("Correct Answer:")
                                    .font(.headline)
                                    .foregroundColor(.green)
                                
                                if let answer = question.answer, !answer.isEmpty {
                                    Text(answer)
                                        .padding()
                                        .background(Color.green.opacity(0.1))
                                        .cornerRadius(8)
                                } else {
                                    Text("No answer provided")
                                        .italic()
                                        .foregroundColor(.gray)
                                }
                            }
                            
                            Button(action: {
                                // Reset to try again
                                hasSubmitted = false
                                userAnswer = ""
                            }) {
                                Text("Try Again")
                                    .frame(maxWidth: .infinity)
                                    .padding()
                                    .background(Color.blue)
                                    .foregroundColor(.white)
                                    .cornerRadius(8)
                            }
                            .padding(.top, 16)
                        }
                    }
                    
                    // Posted by info
                    if let user = question.user, let userName = user.userName {
                        Spacer()
                        HStack {
                            Spacer()
                            VStack(alignment: .trailing) {
                                Text("Posted by: \(userName)")
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                                
                                if let createTime = question.createTime {
                                    Text(formatDate(createTime))
                                        .font(.caption)
                                        .foregroundColor(.secondary)
                                }
                            }
                        }
                        .padding(.top, 16)
                    }
                }
                .padding()
            } else {
                Text("Question not found")
                    .padding()
            }
        }
        .navigationTitle("Question")
        .onAppear(perform: loadQuestion)
    }
    
    private func loadQuestion() {
        isLoading = true
        
        // Load from file storage
        DispatchQueue.global(qos: .userInitiated).async {
            let questions = JSONFileManager.shared.loadQuestions()
            let foundQuestion = questions.first { $0.id == questionId }
            
            DispatchQueue.main.async {
                self.question = foundQuestion
                self.isLoading = false
            }
        }
        
        // Real API call (commented out)
        /*
        QuestionControllerAPI.getQuestionVOByIdUsingGET(id: questionId) { response, error in
            DispatchQueue.main.async {
                self.isLoading = false
                
                if let error = error {
                    print("Error loading question: \(error)")
                    return
                }
                
                self.question = response?.data
            }
        }
        */
    }
    
    private func submitAnswer() {
        isSubmitting = true
        
        // Check answer
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            // Simple check: If the user's answer contains any word from the correct answer
            if let correctAnswer = self.question?.answer?.lowercased() {
                let userAnswerLowercased = self.userAnswer.lowercased()
                let correctKeywords = correctAnswer.split(separator: " ")
                    .map { String($0) }
                    .filter { $0.count > 5 } // Only check words with 5+ characters
                
                self.isCorrect = correctKeywords.contains { userAnswerLowercased.contains($0.lowercased()) }
            } else {
                self.isCorrect = false
            }
            
            self.hasSubmitted = true
            self.isSubmitting = false
        }
    }
    
    private func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter.string(from: date)
    }
}
