//
//  LearnForumApp.swift
//  LearnForum
//
//  Created by Hongyuan Wang on 29/4/2025.
//
import SwiftUI

@main
struct QuestionBankApp: App {
    init() {
        // Set the base path for all API controllers
        // You'll need to replace this with your actual API URL
        // comment out for now
//        QuestionControllerAPI.basePath = "https://your-api-server.com"
//        QuestionBankControllerAPI.basePath = "https://your-api-server.com"
//        QuestionBankQuestionControllerAPI.basePath = "https://your-api-server.com"
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
