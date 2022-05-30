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
    
    init() {
        // check if user exists
        userSession = Auth.auth().currentUser
    }
    func login (){
        print("login")

    }
    
    func register (withEmail email: String, password: String){
        
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print(error.localizedDescription)
                return
            } else {
                guard let user = result?.user else { return }
                self.userSession = user
                print("User registered successfully")
            }
            
        }
        
            print(email)
            print(password)
    }
    
    func signout (){
        print("signout")

    }
    
    func resetpassword (){
        print("reset password")
    }
    
    func fetchUser (){
        print("fetchuser")
    }
}
