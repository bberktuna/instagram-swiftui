//
//  ImageUploader.swift
//  instagramClone
//
//  Created by berk tuna on 30/05/2022.
//

import UIKit
import Firebase
import FirebaseStorage

struct ImageUploader {
    static func UploadImage(image: UIImage, completion: @escaping(String) -> Void ) {
        guard let imageData = image.jpegData(compressionQuality: 0.5) else {return}
        let fileName = NSUUID().uuidString
        let ref = Storage.storage().reference(withPath: "/profile_images/\(fileName)")
        ref.putData(imageData, metadata: nil) { _, error in
            if let error = error {
                print("DEBUG: Failed to upload image \(error.localizedDescription)")
                return
            }
            
            print("Successfully uploaded image...")
            
            ref.downloadURL{url, _ in
                guard let imageUrl = url?.absoluteString else {return}
                completion(imageUrl)
                
            }
        }
    }
}
