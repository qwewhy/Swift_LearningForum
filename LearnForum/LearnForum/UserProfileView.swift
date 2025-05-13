//
//  UserProfileView.swift
//  LearnForum
//
//  Created by Jingyu on 2025/5/11.
//


import SwiftUI

struct UserProfileView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                // 头像
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .foregroundColor(.blue)
                
                // 用户名
                Text("Johnny")
                    .font(.title)
                    .fontWeight(.bold)
                
                // 信息
                VStack(alignment: .leading, spacing: 12) {
                    infoRow(title: "Username", value: "Johnny")
                    infoRow(title: "Email", value: "Johnny123@gmail.com")
                    infoRow(title: "Gender", value: "Male")
                    infoRow(title: "Register time", value: "2025-05-10")
                    infoRow(title: "Phone", value: "(+61) 4533 39075")
                }
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(12)
                .padding(.horizontal)
              
                VStack(spacing: 12) {
                    Button(action: {
                        //收藏问题
                    }) {
                        HStack {
                            Image(systemName: "star.fill")
                            Text("Favorite qquestions")
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.orange)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                    }
                    
                    Button(action: {
                        //提过的问题
                    }) {
                        HStack {
                            Image(systemName: "bubble.left.and.bubble.right.fill")
                            Text("Asked questions")
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                    }
                }
                .padding(.horizontal)
                
                Spacer()
            }
            .padding(.top)
        }
        .navigationTitle("User Profile")
    }
    
    @ViewBuilder
    private func infoRow(title: String, value: String) -> some View {
        HStack {
            Text("\(title):")
                .fontWeight(.semibold)
            Spacer()
            Text(value)
        }
    }
}

struct UserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            UserProfileView()
        }
    }
}

#Preview {
    UserProfileView()
}
