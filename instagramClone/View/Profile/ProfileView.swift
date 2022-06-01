//
//  ProfileView.swift
//  instagramClone
//
//  Created by berk tuna on 16/05/2022.
//

import SwiftUI

struct ProfileView: View {
    let user: User
    @ObservedObject var viewModel: ProfileViewModel
    
    init(user: User){
        self.user = user
        self.viewModel = ProfileViewModel(user: user)
    }
    var body: some View {
        ScrollView {
            VStack(spacing: 32) {
                ProfileHeaderView(viewModel: viewModel)
                
                PostGridView()
            }.padding(.top)
        }
    }
}
