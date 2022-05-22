//
//  ProfileHeaderView.swift
//  instagramClone
//
//  Created by berk tuna on 22/05/2022.
//

import SwiftUI

struct ProfileHeaderView: View {
    var body: some View {
        VStack(alignment: .leading){
            HStack {
                Image("cat3")
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
            Text("berktuna")
                .font(.system(size: 15, weight: .semibold))
                .padding([.leading, .top])
            Text("dit is description")
                .font(.system(size : 15))
                .padding(.leading)
                .padding(.top , 1 )
            
            HStack {
                Spacer()
                ProfileActionButtonView()
                Spacer()
            }.padding(.top)
        }
    }
}

struct ProfileHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeaderView()
    }
}
