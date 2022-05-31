//
//  UserListView.swift
//  instagramClone
//
//  Created by berk tuna on 18/05/2022.
//

import SwiftUI

struct UserListView: View {
    @ObservedObject var viewModel: SearchViewModel
    // SEARCH VIEW IS NOT AN INITIALIZER ITS A INSTANCE BECAUSE IF WE INITIALIZE IT TWICE IT WILL
    // READ THE DATABASE TWICE
    @Binding var searchText: String
    
    var users: [User] {
        searchText.isEmpty ? viewModel.users : viewModel.filteredUsers(searchText)
    }
    var body: some View {
        
        ScrollView {
            LazyVStack {
                ForEach(users){ user in
                    NavigationLink(
                        destination: ProfileView()   ,
                        label: {
                            UserCell(user: user)
                            .padding(.leading)
                            
                        })
                }
            }
        }
    }
}

