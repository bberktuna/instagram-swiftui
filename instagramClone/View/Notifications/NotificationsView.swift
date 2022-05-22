//
//  NotificationView.swift
//  instagramClone
//
//  Created by berk tuna on 16/05/2022.
//

import SwiftUI

struct NotificationsView: View {    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 20) {
                ForEach(0..<10){ _ in
                    NotificationCell()
                }
            }
        }
    }
}

struct NotificationsView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationsView()
    }
}
