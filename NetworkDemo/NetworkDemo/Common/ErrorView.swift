//
//  ErrorView.swift
//  NetworkDemo
//
//  Created by Koneti Santhosh Kumar on 9/19/26.
//

import SwiftUI

struct ErrorView: View {
    let message: String

    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: "exclamationmark.triangle")
                .font(.largeTitle)
                .foregroundColor(.red)
            Text(message)
                .foregroundColor(.red)
                .multilineTextAlignment(.center)
        }
        .padding()
    }
}
