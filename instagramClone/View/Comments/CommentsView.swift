//
//  CommentsView.swift
//  instagramClone
//
//  Created by berk tuna on 01/06/2022.
//

import SwiftUI

struct CommentsView: View {
    @State var commentText = ""
    var body: some View {
        VStack {
            // comment cells
            ScrollView {
                LazyVStack(alignment: .leading, spacing: 24) {
                    ForEach(0..<10) { _ in
                        CommentCell()
                    }
                }
            }.padding(.top)
            
            CustomInputView(inputText: $commentText, action: uploadComment)
        }
    }
    
    func uploadComment(){
        
    }
}
