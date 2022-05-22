//
//  NotificationCell.swift
//  instagramClone
//
//  Created by berk tuna on 22/05/2022.
//

import SwiftUI

struct NotificationCell: View {
    @State private var showPostImage = true
    var body: some View {
        HStack {
            Image("cat3")
                .resizable()
                .scaledToFill()
                .frame(width: 40, height: 40)
                .clipShape(Circle())
            
            Text("berktuna")
                .font(.system(size: 14, weight: .semibold)) +
            Text(" started following you")
                .font(.system(size:15))
            
            Spacer()
            if showPostImage {
                Image("cat2")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40)
            } else {
                Button(action: {}, label: {
                    Text("Follow")
                        .padding(.horizontal, 20)
                        .padding(.vertical, 8)
                        .background(Color(.systemBlue))
                        .foregroundColor(.white)
                        .clipShape(Capsule())
                        .font(.system(size: 14, weight: .semibold))
                })
            }
                
            

        }.padding(.horizontal)
    }
}

struct NotificationCell_Previews: PreviewProvider {
    static var previews: some View {
        NotificationCell()
    }
}
