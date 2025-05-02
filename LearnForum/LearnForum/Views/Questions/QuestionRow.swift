//
//  QuestionRow.swift
//  LearnForum
//
//  Created by Yanao Kong on 1/5/2025.
//

import SwiftUI

struct QuestionRow: View {
    let question: QuestionVO
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(question.title ?? "Untitled")
                .font(.headline)
            if let content = question.content, !content.isEmpty {
                Text(content)
                    .font(.subheadline)
                    .lineLimit(1)
                    .foregroundColor(.gray)
            }
        }
        .padding(.vertical, 4)
    }
}

