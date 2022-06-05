//
//  CommentsViewModel.swift
//  instagramClone
//
//  Created by berk tuna on 05/06/2022.
//

import SwiftUI
import Firebase

class NotificationsViewModel: ObservableObject {
    @Published var notifications = [Notification]()
    
    func fetchNotifications(){
        
    }
    
    static func uploadNotification(toUid uid: String, type: NotificationType, post: Post? = nil){
        guard let user = AuthViewModel.shared.currentUser else { return }
        
        var data: [String: Any] = [
            "username": user.username,
            "profileImageUrl": user.profileImageUrl,
            "timestamp": Timestamp(date: Date()),
            "type":type.rawValue ,
            "uid": user.id ?? ""
        ]
        
        if let post = post, let id = post.id {
            data["postId"] = id
        }
        
        COLLECTION_NOTIFICATIONS.document(uid).collection("user-notifications").addDocument(data: data)
    }
    
    
}
