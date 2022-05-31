//
//  SearchViewModel.swift
//  instagramClone
//
//  Created by berk tuna on 31/05/2022.
//

import SwiftUI

class SearchViewModel: ObservableObject {
    @Published var users = [User]()
    
    init(){
        fetchUsers()
    }
    
    func fetchUsers(){
        COLLECTION_USERS.getDocuments{snapshot, _ in // REACH OUT THE USERS DOCUMENTS AND COLLECT ALL OF THEM
            guard let documents = snapshot?.documents else { return } // SAFELY UNWRAP THE DOCUMENTS, SEE IF THEY EXISTS
            
            documents.forEach{ document in
                guard let user = try? document.data(as: User.self) else { return }
                self.users.append(user)
                print(self.users)
            }
//            self.users = documents.compactMap({ try? $0.data(as: User.self)}) // USE THE DECODABLE PROTOCOL TO SET THE USERS
//            print(self.users)
        }
    }
    
    
    func filteredUsers(_ query: String) -> [User] {
        // PUT THEESE USERS IN TO USER ARRAY AND RETURN THEM

        let lowercasedQuery = query.lowercased()
        return users.filter({
            $0.fullName.lowercased().contains(lowercasedQuery) ||
            $0.username.lowercased().contains(lowercasedQuery) })
        // $0 REPRESENTS THE USER OF USERS ARRAY
    }
    
}
