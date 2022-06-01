
//
//  FeedCell.swift
//  instagramClone
//
//  Created by berk tuna on 17/05/2022.
//

import SwiftUI
import Kingfisher

struct FeedCell: View {
    let post: Post
    var body: some View {
        VStack(alignment: .leading) {
            // user info
            HStack {
                KFImage(URL(string: post.ownerImageUrl))
                
                    .resizable()
                    .scaledToFill()
                    .frame(width: 36, height: 36)
                    .clipped()
                    .cornerRadius(18)
                
                Text(post.ownerUsername)
                    .font(.system(size: 14, weight: .semibold))
            }.padding([.leading, .bottom], 6)
            // post image
            KFImage(URL(string: post.imageUrl))
                .resizable()
                .scaledToFill()
                .frame(maxHeight: 440)
                .clipped()
            
            // action buttons
            HStack(spacing: 12) {
                Button(action: {}, label: {
                    Image(systemName: "heart")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 20, height: 20)
                        .font(.system(size: 20))
                        .padding(4)
                })
                
                Button(action: {}, label: {
                    Image(systemName: "bubble.right")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 20, height: 20)
                        .font(.system(size: 20))
                        .padding(4)
                })
                
                Button(action: {}, label: {
                    Image(systemName: "paperplane")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 20, height: 20)
                        .font(.system(size: 18))
                        .padding(4)
                })
            }.foregroundColor(.black)
            
            // caption
            Text("23 likes")
                .font(.system(size: 14, weight: .semibold))
                .padding(.leading, 6 )
                .padding(.bottom, 0.5)

            HStack {
                Text(post.ownerUsername)
                    .font(.system(size: 14, weight: .semibold)) +
                Text("\(post.caption)")
                    .font(.system(size:15))
            }.padding(.horizontal, 6)
            Text("")
                .font(.system(size: 14))
                .foregroundColor(.gray)
                .padding(.leading, 8)
                .padding(.top , -6)
            
        }
    }
}

