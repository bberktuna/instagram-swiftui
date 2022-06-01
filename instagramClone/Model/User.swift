//
//  User.swift
//  instagramClone
//
//  Created by berk tuna on 31/05/2022.
//
import FirebaseFirestoreSwift

struct User: Identifiable, Decodable {
    let username: String
    let email: String
    let fullName: String
    let profileImageUrl: String
    @DocumentID var id: String?
    var isFollowed: Bool? = false
    
    var isCurrentUser: Bool { return AuthViewModel.shared.userSession?.uid == id}
}
