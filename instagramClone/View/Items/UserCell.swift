//
//  UserCell.swift
//  instagramClone
//
//  Created by berk tuna on 18/05/2022.
//

import SwiftUI

struct UserCell: View {
    var body: some View {
        HStack {
            Image("cat3")
                .resizable()
                .scaledToFill()
                .frame(width: 48, height: 48)
                .clipShape(Circle())
                
        
        
        VStack(alignment: .leading) {
            Text("berktuna")
                .font(.system(size: 14, weight: .semibold))
            
            Text("Berk Tuna")
                .font(.system(size: 14))
            }
            Spacer()
        }
    }
     
}

struct UserCell_Previews: PreviewProvider {
    static var previews: some View {
        UserCell()
    }
}
