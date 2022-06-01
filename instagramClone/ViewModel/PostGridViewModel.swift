//
//  PostGridViewModel.swift
//  instagramClone
//
//  Created by berk tuna on 01/06/2022.
//

import Foundation

enum PostGridConfiguration {
    case search
    case profile(String)
}

class PostGridViewModel: ObservableObject {
    @Published var posts = [Post]()
    let config: PostGridConfiguration

    init(config: PostGridConfiguration){
        self.config = config
        fetchPosts(forConfig: config)
    }
    
    func fetchPosts(forConfig config: PostGridConfiguration) {
        switch config {
        case .search:
            fetchSearchPagePosts()
        case .profile(let uid):
            fetchProfilePosts(forUid: uid)
        }
    }
    
    
    func fetchSearchPagePosts(){
        COLLECTION_POSTS.getDocuments{ post, _ in
            guard let documents = post?.documents else { return }
            self.posts = documents.compactMap({try? $0.data( as: Post.self )})
        }
    
    }
    
    func fetchProfilePosts(forUid uid: String){
        COLLECTION_POSTS.whereField("ownerUid", isEqualTo: uid).getDocuments{ post, _ in
            guard let documents = post?.documents else { return }
            self.posts = documents.compactMap({try? $0.data( as: Post.self )})
            
        }
        
    }
}
