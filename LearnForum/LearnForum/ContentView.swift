//
//  ContentView.swift
//  LearnForum
//
//  Created by Hongyuan Wang on 29/4/2025.
//

import SwiftUI
@testable import LearnForumAPIClient

struct ContentView: View {
    @State private var isLoggedIn = false
    @State private var userData: LoginUserVO? = nil
    
    var body: some View {
        Group {
            if isLoggedIn {
                // 已登录状态显示主界面
                MainTabView(userData: $userData, isLoggedIn: $isLoggedIn)
            } else {
                // 未登录状态显示登录界面
                LoginView()
                    .onReceive(NotificationCenter.default.publisher(for: .userLoggedIn)) { notification in
                        if let userData = notification.object as? LoginUserVO {
                            self.userData = userData
                            self.isLoggedIn = true
                        }
                    }
            }
        }
        .onAppear {
            checkLoginStatus()
        }
        .onReceive(NotificationCenter.default.publisher(for: .userLoggedOut)) { _ in
            self.isLoggedIn = false
            self.userData = nil
        }
    }
    
    private func checkLoginStatus() {
        UserControllerAPI.getLoginUserUsingGET { response, error in
            if let error = error {
                print("获取用户信息错误: \(error)")
                self.isLoggedIn = false
                return
            }
            
            guard let response = response, response.code == 0, let userData = response.data else {
                self.isLoggedIn = false
                return
            }
            
            self.userData = userData
            self.isLoggedIn = true
        }
    }
}

// 主界面标签视图
struct MainTabView: View {
    @Binding var userData: LoginUserVO?
    @Binding var isLoggedIn: Bool
    
    var body: some View {
        TabView {
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("你好，\(userData?.userName ?? "用户")")
                
                Button("退出登录") {
                    logout()
                }
                .padding()
                .background(Color.red)
                .foregroundColor(.white)
                .cornerRadius(8)
                .padding(.top, 20)
            }
            .padding()
            .tabItem { 
                Label("Home", systemImage: "house")
            }
            
            QuestionBankView()
                .tabItem {
                    Label("Question bank", systemImage: "folder")
                }
        }
    }
    
    private func logout() {
        UserControllerAPI.userLogoutUsingPOST { response, error in
            if let error = error {
                print("退出登录失败: \(error)")
                return
            }
            
            NotificationCenter.default.post(name: .userLoggedOut, object: nil)
        }
    }
}

// 定义通知名称
extension Notification.Name {
    static let userLoggedIn = Notification.Name("userLoggedIn")
    static let userLoggedOut = Notification.Name("userLoggedOut")
}

#Preview {
    ContentView()
}
