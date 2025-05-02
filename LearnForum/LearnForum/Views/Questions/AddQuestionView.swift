// Views/Questions/AddQuestionView.swift
import SwiftUI

struct AddQuestionView: View {
    let onQuestionAdded: (QuestionVO) -> Void
    
    @State private var title = ""
    @State private var content = ""
    @State private var answer = ""
    @State private var tags = ""
    @State private var isSubmitting = false
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        Form {
            Section(header: Text("Question Info")) {
                TextField("Title", text: $title)
                TextEditor(text: $content)
                    .frame(minHeight: 100)
            }
            
            Section(header: Text("Answer (Optional)")) {
                TextEditor(text: $answer)
                    .frame(minHeight: 100)
            }
            
            Section(header: Text("Tags (Comma separated)")) {
                TextField("swift, ios, networking", text: $tags)
            }
            
            Button(action: submitQuestion) {
                if isSubmitting {
                    ProgressView()
                } else {
                    Text("Submit Question")
                }
            }
            .disabled(title.isEmpty || isSubmitting)
        }
        .navigationTitle("Add Question")
    }
    
    private func submitQuestion() {
        isSubmitting = true
        
        // Create a new question
        let tagList = tags.split(separator: ",").map { String($0.trimmingCharacters(in: .whitespaces)) }
        
        let newQuestion = QuestionVO(
            answer: answer.isEmpty ? nil : answer,
            content: content,
            createTime: Date(),
            id: nil, // Will be auto-generated
            tagList: tagList.isEmpty ? nil : tagList,
            title: title,
            updateTime: Date(),
            user: UserVO(
                createTime: Date(),
                email: "current.user@example.com",
                id: "current",
                updateTime: Date(),
                userAvatar: nil,
                userName: "Current User"
            ),
            userId: 999
        )
        
        // Save to file
        DispatchQueue.global(qos: .userInitiated).async {
            let success = JSONFileManager.shared.addQuestion(newQuestion)
            
            DispatchQueue.main.async {
                isSubmitting = false
                
                if success {
                    onQuestionAdded(newQuestion)
                    presentationMode.wrappedValue.dismiss()
                } else {
                    // Handle error (could add an alert here)
                    print("Failed to save question")
                }
            }
        }
        
        // Real API call (commented out)
        /*
        let request = QuestionAddRequest()
        request.title = title
        request.content = content
        request.answer = answer.isEmpty ? nil : answer
        
        if !tags.isEmpty {
            request.tags = tags.split(separator: ",").map { String($0.trimmingCharacters(in: .whitespaces)) }
        }
        
        QuestionControllerAPI.addQuestionUsingPOST(questionAddRequest: request) { response, error in
            DispatchQueue.main.async {
                self.isSubmitting = false
                
                if let error = error {
                    print("Error adding question: \(error)")
                    return
                }
                
                if let id = response?.data {
                    let tagList = self.tags.split(separator: ",").map { String($0.trimmingCharacters(in: .whitespaces)) }
                    
                    let newQuestion = QuestionVO(
                        answer: self.answer.isEmpty ? nil : self.answer,
                        content: self.content,
                        createTime: Date(),
                        id: id,
                        tagList: tagList.isEmpty ? nil : tagList,
                        title: self.title,
                        updateTime: Date(),
                        user: nil,
                        userId: nil
                    )
                    
                    self.onQuestionAdded(newQuestion)
                    self.presentationMode.wrappedValue.dismiss()
                }
            }
        }
        */
    }
}
