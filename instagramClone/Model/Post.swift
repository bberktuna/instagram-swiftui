//
//  Post.swift
//  instagramClone
//
//  Created by berk tuna on 01/06/2022.
//

import Firebase
import FirebaseFirestoreSwift

struct Post: Identifiable, Decodable {
    @DocumentID var id: String?
    let ownerUid: String
    let ownerUsername: String
    let caption: String
    var likes: Int
    let ownerImageUrl: String
    let imageUrl: String    
    let timestamp: Timestamp
    
    var didLike: Bool? = false
}
