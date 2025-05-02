//
//  JSONFileManager.swift
//  LearnForum
//
//  Created by Yanao Kong on 2/5/2025.
//
import Foundation

class JSONFileManager {
    static let shared = JSONFileManager()
    
    private init() {}
    
    // Get the document directory path
    private func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    // Get the file URL for our questions JSON file
    private func getQuestionsFileURL() -> URL {
        return getDocumentsDirectory().appendingPathComponent("questions.json")
    }
    
    // Load questions from file
    func loadQuestions() -> [QuestionVO] {
        let fileURL = getQuestionsFileURL()
        print("Scores file path: \(fileURL)")
        
        
        // Check if file exists
        guard FileManager.default.fileExists(atPath: fileURL.path) else {
            // If not, create it with sample data
            let sampleQuestions = createSampleQuestions()
            saveQuestions(sampleQuestions)
            return sampleQuestions
        }
        
        do {
            let data = try Data(contentsOf: fileURL)
            let questions = try JSONDecoder().decode([QuestionVO].self, from: data)
            return questions
        } catch {
            print("Error loading questions from file: \(error)")
            return createSampleQuestions()
        }
    }
    
    // Save questions to file
    func saveQuestions(_ questions: [QuestionVO]) -> Bool {
        let fileURL = getQuestionsFileURL()
        
        do {
            let encoder = JSONEncoder()
            encoder.outputFormatting = .prettyPrinted
            let data = try encoder.encode(questions)
            try data.write(to: fileURL)
            return true
        } catch {
            print("Error saving questions to file: \(error)")
            return false
        }
    }
    
    // Add a new question and save the updated list
    func addQuestion(_ question: QuestionVO) -> Bool {
        var questions = loadQuestions()
        
        // Generate a new ID if not set
        var newQuestion = question
        if newQuestion.id == nil {
            let maxId = questions.map { $0.id ?? 0 }.max() ?? 0
            newQuestion.id = maxId + 1
        }
        
        questions.append(newQuestion)
        return saveQuestions(questions)
    }
    
    // Create sample questions if needed
    private func createSampleQuestions() -> [QuestionVO] {
        return [
            QuestionVO(
                answer: "Swift is a powerful and intuitive programming language developed by Apple. It was first introduced in 2014 and has since become the primary language for Apple platform development.",
                content: "I'm new to iOS development. What exactly is Swift and why should I use it?",
                createTime: Date(),
                id: 1,
                tagList: ["iOS", "Swift", "Programming"],
                title: "What is Swift?",
                updateTime: Date(),
                user: UserVO(
                    createTime: Date(),
                    email: "john@example.com",
                    id: "1",
                    updateTime: Date(),
                    userAvatar: "https://randomuser.me/api/portraits/men/1.jpg",
                    userName: "John Doe"
                ),
                userId: 1
            ),
            QuestionVO(
                answer: "SwiftUI is a declarative framework for building user interfaces across all Apple platforms.",
                content: "I've used UIKit before, but what's the advantage of switching to SwiftUI?",
                createTime: Date(),
                id: 2,
                tagList: ["iOS", "SwiftUI", "UIKit"],
                title: "SwiftUI vs UIKit",
                updateTime: Date(),
                user: UserVO(
                    createTime: Date(),
                    email: "jane@example.com",
                    id: "2",
                    updateTime: Date(),
                    userAvatar: "https://randomuser.me/api/portraits/women/1.jpg",
                    userName: "Jane Smith"
                ),
                userId: 2
            ),
            QuestionVO(
                answer: "Core Data is Apple's framework for managing object lifecycles and persistence.",
                content: "What's the best way to persist data in an iOS app? Should I use Core Data, Realm, or something else?",
                createTime: Date(),
                id: 3,
                tagList: ["iOS", "Core Data", "Persistence"],
                title: "Data Persistence in iOS",
                updateTime: Date(),
                user: UserVO(
                    createTime: Date(),
                    email: "mike@example.com",
                    id: "3",
                    updateTime: Date(),
                    userAvatar: "https://randomuser.me/api/portraits/men/2.jpg",
                    userName: "Mike Johnson"
                ),
                userId: 3
            )
        ]
    }
}
