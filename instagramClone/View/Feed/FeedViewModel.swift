//
//  FeedViewModel.swift
//  instagramClone
//
//  Created by berk tuna on 01/06/2022.
//

import SwiftUI

class FeedViewModel: ObservableObject {
    @Published var posts = [Post]()
//    @Published var isLiked: Bool? = false
    
    init(){
        fetchPosts()
    }
    
    func fetchPosts(){
        COLLECTION_POSTS.getDocuments{ post, _ in
            guard let documents = post?.documents else { return }
            self.posts = documents.compactMap({try? $0.data( as: Post.self )})
            print(self.posts)
        }
        
    }
}
