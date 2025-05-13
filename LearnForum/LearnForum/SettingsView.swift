//
//  SettingsView.swift
//  LearnForum
//
//  Created by Jingyu on 2025/5/11.
//


import SwiftUI

struct SettingsView: View {
    @State private var isDarkMode = false
    @State private var notificationsEnabled = true
    @State private var fontSize: Double = 16
    
    var body: some View {
        Form {
            // 外观
            Section(header: Text("Appearance")) {
                Toggle("Dark Mode", isOn: $isDarkMode)
            }
            
            // 通知
            Section(header: Text("Notification")) {
                Toggle("Enable Notification", isOn: $notificationsEnabled)
            }
            
            // 字体大小
            Section(header: Text("Font Size")) {
                HStack {
                    Slider(value: $fontSize, in: 12...24, step: 1)
                    Text("\(Int(fontSize)) pt")
                        .frame(width: 50, alignment: .trailing)
                }
            }
            
            // 修改密码
            Section {
                NavigationLink(destination: ChangePasswordView()) {
                    Text("Change Password")
                }
            }
        }
        .navigationTitle("Settings")
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SettingsView()
        }
    }
}


struct ChangePasswordView: View {
    @State private var oldPassword = ""
    @State private var newPassword = ""
    @State private var confirmPassword = ""
    
    var body: some View {
        Form {
            SecureField("Old Password", text: $oldPassword)
            SecureField("New Password", text: $newPassword)
            SecureField("Confirm new password", text: $confirmPassword)
            
            Button("Submit") {
                // TODO: 修改密码逻辑
            }
            .disabled(newPassword.isEmpty || newPassword != confirmPassword)
        }
        .navigationTitle("Change Password")
    }
}

#Preview {
    SettingsView()
}
