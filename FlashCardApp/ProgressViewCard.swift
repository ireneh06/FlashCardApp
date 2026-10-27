//
//  ProgressView.swift
//  FlashCardApp
//
//  Created by Irene Hofer on 23.10.26.
//
import SwiftUI

struct ProgressViewCard: View {
    let knownWords: Int
    let totalWords: Int

    var progress: Double {
        guard totalWords > 0 else { return 0 }
        return Double(knownWords) / Double(totalWords)
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Progress")
                .font(.headline)

            ProgressView(value: progress)
                .tint(.green)

            HStack {
                Text("\(knownWords) out of \(totalWords) words")
                Spacer()
                Text("\(Int(progress * 100)) %")
            }
            .font(.caption)
        }
        .padding()
    }
}
