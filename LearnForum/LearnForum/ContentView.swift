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
                print("Error getting user information: \(error)")
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
            //user profile
            NavigationView {
                VStack(spacing: 20) {
                    //头像用户名
                    NavigationLink(destination: UserProfileView()) {
                        VStack {
                            Image(systemName: "person.circle.fill")
                                .resizable()
                                .frame(width: 120, height: 120)
                                .foregroundColor(.blue)
                            Text(userData?.userName ?? "Johnny")
                                .font(.title2)
                                .foregroundColor(.primary)
                        }
                    }
                    //用户信息
                    VStack(alignment: .leading, spacing: 10) {
                        Text("User name: \(userData?.userName ?? "Johnny")")
                        Text("Email: Johnny123@gmail.com")
                        Text("Register time: 2025-05-10")
                    }
                    .font(.body)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    
                    Spacer()
                    
                    //提问
                    NavigationLink(destination: AskQuestionView()) {
                        Text("Ask question")
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.green)
                            .cornerRadius(10)
                            .padding(.horizontal)
                    }
                    
                    //设置
                    NavigationLink(destination: SettingsView()) {
                        Text("Settings")
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.gray)
                            .cornerRadius(10)
                            .padding(.horizontal)
                    }
                    
                    //退出登录
                    Button(action: logout) {
                        Text("Exit")
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.red)
                            .cornerRadius(10)
                            .padding(.horizontal)
                    }
                    Spacer()
                }
                .padding()
                .navigationTitle("User Center")
            }
            .tabItem {
                Label("Home", systemImage: "house")
            }
            
            
            QuestionBankView()
                .tabItem {
                    Label("Question Bank", systemImage: "folder")
                }
        }
    }
    
    private func logout() {
        UserControllerAPI.userLogoutUsingPOST { response, error in
            if let error = error {
                print("Failed to exit: \(error)")
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
