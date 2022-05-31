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
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(viewModel.users){ user in
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

