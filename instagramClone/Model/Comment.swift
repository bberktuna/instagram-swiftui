//
//  Comment.swift
//  instagramClone
//
//  Created by berk tuna on 01/06/2022.
//

import FirebaseFirestoreSwift
import Firebase

struct Comment: Identifiable, Decodable {
    @DocumentID var id: String?
    let username: String
    let posOwnerUid: String
    let profileImageUrl: String
    let commentText: String
    let timestamp: Timestamp
    let uid: String
}
