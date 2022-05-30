//
//  instagramCloneApp.swift
//  instagramClone
//
//  Created by berk tuna on 16/05/2022.
//

import SwiftUI
import Firebase

@main
struct instagramCloneApp: App {
    init()	{
        FirebaseApp.configure()
    }
    
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(AuthViewModel())
        }
    }
}
