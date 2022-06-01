//
//  AuthViewModel.swift
//  instagramClone
//
//  Created by berk tuna on 30/05/2022.
//

import SwiftUI
import Firebase

class AuthViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User? // keep track of user
    @Published var currentUser: User?
    static let shared = AuthViewModel()
    
    init() {
        userSession = Auth.auth().currentUser // check if user exists
        fetchUser()
    }
    
    // AUTHENTICATION FUNCTIONS
    func login (withEmail email: String, password: String ){
        Auth.auth().signIn(withEmail: email, password: password ) { result, error in
            if let error = error {
                print("DEBUG: Failed to login \(error.localizedDescription)")
                return
            }
            guard let user = result?.user else { return }
            self.userSession = user
            print("Successfully logged in...")
            self.fetchUser()
        }
        
    }
    
    func register (
        withEmail email: String,
        password: String,
        image: UIImage?,
        fullName: String,
        username: String
    ){
        guard let image = image else { return }
        ImageUploader.UploadImage(image: image, type: .profile) { imageUrl in
            Auth.auth().createUser(withEmail: email, password: password) { result, error in
                if let error = error {
                    print(error.localizedDescription)
                    return
                } else {
                    guard let user = result?.user else { return }
                    print("User registered successfully")

                    let data = [
                        "email": email,
                        "username": username,
                        "password": password,
                        "fullName": fullName,
                        "profileImageUrl": imageUrl,
                        "uid": user.uid
                    ]
                    COLLECTION_USERS.document(user.uid).setData(data) { _ in
                        print("Successfully uploaded user data...")
                        self.userSession = user
                        self.fetchUser()

                    }
                }
            }
            
        }
        print(email)
        print(password)
    }
    
    func signout (){
        self.userSession = nil
        try? Auth.auth().signOut()
    }
    
    func resetpassword (){
        print("reset password")
    }
    
    func fetchUser (){
        guard let uid = userSession?.uid else { return }
        COLLECTION_USERS.document(uid).getDocument{snapshot, _ in // COMPLETION HANDLER SO WE GET ACCES TO SNAPSHOT
            guard let user = try? snapshot?.data(as: User.self) else { return }
            print("DEBUG: User is \(user)")
            self.currentUser = user
        }
    }
}
