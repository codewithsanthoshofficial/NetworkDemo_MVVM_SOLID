//
//  UsersListView.swift
//  NetworkDemo
//
//  Created by Koneti Santhosh Kumar on 9/19/26.
//

import SwiftUI

struct UsersListView: View {
    @StateObject private var viewModel = UsersViewModel()

    var body: some View {
        NavigationStack {
            Group {
                if viewModel.isLoading {
                    ProgressView()
                } else if let error = viewModel.errorMessage {
                    Text(error).foregroundColor(.red)
                } else {
                    List(viewModel.users) { user in
                        VStack(alignment: .leading) {
                            Text(user.name).font(.headline)
                            Text(user.email).font(.subheadline).foregroundColor(.gray)
                        }
                    }
                }
            }
            .navigationTitle("Users")
            .task { await viewModel.loadUsers() }
        }
    }
}


#Preview {
    UsersListView()
}
