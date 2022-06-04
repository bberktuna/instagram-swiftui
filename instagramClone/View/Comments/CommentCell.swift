//
//  CommentsCell.swift
//  instagramClone
//
//  Created by berk tuna on 01/06/2022.
//

import SwiftUI

struct CommentCell: View {
    var body: some View {
        HStack {
            Image("cat3")
                .resizable()
                .scaledToFill()
                .frame(width: 36, height: 36)
                .clipShape(Circle())
            
            Text("username")
                .font(.system(size: 14, weight: .semibold)) +
            Text(" comment text").font(.system(size: 14))
            
            Text("2m")
                .font(.system(size: 12))
                .foregroundColor(.gray)
        }.padding(.horizontal)
    }
}

struct CommentCell_Previews: PreviewProvider {
    static var previews: some View {
        CommentCell()
    }
}
