//
//  ProfileHeaderView.swift
//  instagramClone
//
//  Created by berk tuna on 22/05/2022.
//

import SwiftUI
import Kingfisher

struct ProfileHeaderView: View {
    @ObservedObject var viewModel: ProfileViewModel
    var body: some View {
        VStack(alignment: .leading){
            HStack {
                KFImage(URL(string: viewModel.user.profileImageUrl))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 80, height: 80)
                    .clipShape(Circle())
                    .padding(.leading)
                
                Spacer()
                
                HStack(spacing: 16) {
                    UserStatView(value: 1, title: "Post")
                    UserStatView(value: 24, title: "Followers")
                    UserStatView(value: 21, title: "Following")
                }.padding(.trailing, 32)
                
            }
            Text(viewModel.user.fullName)
                .font(.system(size: 15, weight: .semibold))
                .padding([.leading, .top])
            Text("dit is description")
                .font(.system(size : 15))
                .padding(.leading)
                .padding(.top , 1 )
            
            HStack {
                Spacer()
                ProfileActionButtonView(viewModel: viewModel)
                Spacer()
            }.padding(.top)
        }
    }
}
