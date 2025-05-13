//
//  UserProfileView.swift
//  LearnForum
//
//  Created by Jingyu on 2025/5/11.
//

import SwiftUI

import LearnForumAPIClient

struct UserProfileView: View {
    @State private var selectedYear: Int = Calendar.current.component(.year, from: Date())
    @State private var signInDays: [Int] = []
    @State private var isLoading: Bool = false

    // @State private var user: LoginUserVO?

    var body: some View {
        NavigationView {
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
                                Text("Favorite questions")
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
                    
                    Form {
                        Section(header: Text("Sign-in Records - \(selectedYear)")) {
                            Stepper("Select Year: \(selectedYear)",
                                    value: $selectedYear,
                                    in: 2020...Calendar.current.component(.year, from: Date()),
                                    step: 1)
                                .onChange(of: selectedYear) { _ in
                                    fetchSignInRecords()
                                }

                            if isLoading {
                                HStack {
                                    Spacer()
                                    ProgressView("Loading...")
                                    Spacer()
                                }
                            } else {
                                Text("Total Sign-in Days This Year: \(signInDays.count)")

                                if !signInDays.isEmpty {
                                    DisclosureGroup("View Sign-in Dates") {
                                        List(signInDays.sorted(), id: \.self) { dayOfYear in
                                            if let date = dateFromDayOfYear(year: selectedYear, dayOfYear: dayOfYear) {
                                                Text(date, style: .date)
                                            } else {
                                                Text("Invalid Date: Day \(dayOfYear)")
                                            }
                                        }
                                        .frame(maxHeight: 200)
                                    }
                                } else {
                                    Text("No Sign-in Records This Year")
                                }
                            }
                        }
                    }
                    .frame(height: 300)
                }
                .padding(.top)
            }
            .navigationTitle("User Profile")
            .onAppear {
                fetchSignInRecords()
            }
        }
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

    func fetchSignInRecords() {
        isLoading = true
        signInDays = []

        UserControllerAPI.getUserSignInRecordUsingGET(year: selectedYear) { response, error in
            DispatchQueue.main.async {
                isLoading = false
                if let error = error {
                    print("Error fetching sign-in records: \(error.localizedDescription)")
                    return
                }

                if let baseResponse = response, let daysData = baseResponse.data {
                    self.signInDays = daysData.compactMap { $0 } 
                } else {
                    print("No sign-in data received or data format error. Response: \(String(describing: response))")
                }
            }
        }
    }

    func dateFromDayOfYear(year: Int, dayOfYear: Int) -> Date? {
        let calendar = Calendar.current
        guard dayOfYear > 0 && dayOfYear <= 366 else {
            return nil
        }

        var dateComponents = DateComponents()
        dateComponents.year = year
        
        guard let firstDayOfYear = calendar.date(from: dateComponents) else {
            return nil
        }
        
        if let specificDate = calendar.date(byAdding: .day, value: dayOfYear - 1, to: firstDayOfYear) {
            if calendar.component(.year, from: specificDate) == year {
                return calendar.startOfDay(for: specificDate)
            }
        }
        return nil
    }
}

struct UserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            UserProfileView()
        }
    }
}
