//
//  ProfileViewModel.swift
//  instagramClone
//
//  Created by berk tuna on 31/05/2022.
//

import SwiftUI

class ProfileViewModel: ObservableObject {
    @Published var user: User
    
    init(user: User) {
        self.user = user
        checkIfUserIsFollowed()
    }
    
    func follow(){
        guard let uid = user.id else { return }
        UserService.follow(uid: uid) { _ in
            NotificationsViewModel.uploadNotification(toUid: uid, type: .follow)
            self.user.isFollowed = true
        }

    }
    
    func unfollow(){
        guard !user.isCurrentUser else { return } // make sure the user is not the current user // you cant follow yourself
        guard let uid = user.id else { return }
        UserService.unfollow(uid: uid){ _  in
            self.user.isFollowed = false
            print("UNFOLLOWED USER:  \(self.user.username)")
        }
        
    }
    
    func checkIfUserIsFollowed(){
        guard let uid = user.id else { return }
        UserService.checkIfUserIsFollowed(uid: uid) { isFollowed in
            self.user.isFollowed = isFollowed
        }
    }
}
