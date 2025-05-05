//
//  LearnForumApp.swift
//  LearnForum
//
//  Created by Hongyuan Wang on 29/4/2025.
//

import SwiftUI
import LearnForumAPIClient

@main
struct LearnForumApp: App {
    init() {
        // Configure API client
        configureAPIClient()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
    
    private func configureAPIClient() {
        // 设置 API 基础 URL - 注意API路径已包含 /api 前缀
        LearnForumAPIClientAPI.basePath = "http://43.165.196.25:8101"
        
        // 检查基础路径是否正确
        print("API基础路径: \(LearnForumAPIClientAPI.basePath)")
        print("问题库查询API完整路径: \(LearnForumAPIClientAPI.basePath)/api/questionBank/list/page")
        
        // 配置默认头信息
        LearnForumAPIClientAPI.customHeaders = [
            "Accept": "application/json",
            "Content-Type": "application/json"
        ]
        
        // 输出配置完成信息
        print("API 客户端配置完成")
    }
}
