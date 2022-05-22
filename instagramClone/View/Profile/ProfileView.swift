//
//  ProfileView.swift
//  instagramClone
//
//  Created by berk tuna on 16/05/2022.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 32) {
                ProfileHeaderView()
                
                PostGridView()
            }.padding(.top)
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
