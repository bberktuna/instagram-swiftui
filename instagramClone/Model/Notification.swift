//
//  Notification.swift
//  instagramClone
//
//  Created by berk tuna on 05/06/2022.
//

import Firebase
import FirebaseFirestoreSwift

struct Notification: Identifiable, Decodable {
    @DocumentID var id: String?
    let postId: String?
    let username: String
    let rofileImageUrl: String
    let timestamp: Timestamp
    let type: Int
    let uid: String
    
}

enum NotificationType: Int, Decodable {
    case like
    case comment
    case follow
    
    var notificationMessage: String {
        switch self {
        case .like: return " liked one of your posts."
        case .comment: return " commented one of your posts."
        case .follow: return " started following you."
        }
    }
}
