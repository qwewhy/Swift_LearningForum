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
            Form {
                Section(header: Text("Personal Information")) {
                    Text("User Information Placeholder")
                    // Add more user information fields here
                }

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
                
                Spacer()
            }
            .navigationTitle("User Center")
            .onAppear {
                fetchSignInRecords()
            }
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

#Preview {
    UserProfileView()
}
