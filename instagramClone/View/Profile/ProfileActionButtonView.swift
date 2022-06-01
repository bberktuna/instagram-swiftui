//
//  ProfileActionButtonView.swift
//  instagramClone
//
//  Created by berk tuna on 23/05/2022.
//

import SwiftUI

struct ProfileActionButtonView: View {
    @ObservedObject var viewModel: ProfileViewModel
    var isFollowed: Bool { return viewModel.user.isFollowed ?? false } // double question mark gives it a default value
    var body: some View {
        if viewModel.user.isCurrentUser {
            // edit profile button
            Button(
                action: {},
                label: {
                    Text("Edit Profile")
                        .font(.system(size: 14))
                        .frame(width: 360, height: 32)
                        .foregroundColor(.black)
                        .overlay(RoundedRectangle(cornerRadius: 3)
                            .stroke(Color.gray, lineWidth: 1)
                        )
                        
                        
            })
        } else {
            // follow and message button
            HStack {
                Button(
                    action: { isFollowed ? viewModel.unfollow() : viewModel.follow() },
                    label: {
                        Text(isFollowed ? "Following" : "Follow")
                            .font(.system(size: 14))
                            .frame(width: 172, height: 32)
                            .foregroundColor(isFollowed ? .black : .white)
                            .background(isFollowed ? Color.white : Color.blue)
                            .overlay(RoundedRectangle(cornerRadius: 3)
                                .stroke(Color.gray, lineWidth: isFollowed ? 1 : 0)
                            )
                            .padding(.leading)
                            
                    }).cornerRadius(3)
                    
                Button(
                    action: {},
                    label: {
                        Text("Message")
                            .font(.system(size: 14))
                            .frame(width: 172, height: 32)
                            .foregroundColor(.black)
                            .overlay(RoundedRectangle(cornerRadius: 3)
                                .stroke(Color.gray, lineWidth: 1)
                            )
                            .padding(.leading)
                            
                })
            }.padding(.trailing)
        }
    }
}

