//
//  UploadPostViewModel.swift
//  instagramClone
//
//  Created by berk tuna on 01/06/2022.
//

import SwiftUI
import Firebase

class UploadPostViewModel: ObservableObject {
    func uploadPost( caption: String, image: UIImage, completion: FirestoreCompletion ){
        guard let user = AuthViewModel.shared.currentUser else {return}
        
        ImageUploader.UploadImage(image: image, type: .post) { imageUrl in
            let data = [
                "caption": caption,
                "timestamp": Timestamp(date: Date()),
                "likes": 0,
                "imageUrl": imageUrl,
                "ownerUid": user.id ?? "",
                "ownerImageUrl": user.profileImageUrl,
                "ownerUsername": user.username
            ] as [String : Any]
                
            COLLECTION_POSTS.addDocument(data: data, completion: completion)
        }
    }
}
