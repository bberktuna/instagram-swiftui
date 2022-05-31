//
//  SearchBar.swift
//  instagramClone
//
//  Created by berk tuna on 18/05/2022.
//

import SwiftUI

struct SearchBar: View {
    @Binding var text: String
    @Binding var isEditing: Bool
    var body: some View {
        HStack {
            TextField("Search...", text: $text)
                .padding(8)
                .padding(.horizontal, 24)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .autocapitalization(.none)
                .disableAutocorrection(true)
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .padding(.leading, 8)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        
                    }
                )
                .onTapGesture {
                    isEditing = true
                }
            if isEditing {
                Button(action: {
                    isEditing = false
                    text = ""
                    UIApplication.shared.endEditing()
                    
                },  label: {
                    Text("Cancel")
                        .foregroundColor(.black)
                    
                })
                .padding(.trailing, 8)
                .transition(.move(edge: .trailing))
                .animation(.linear(duration: 1), value: 1)


            }
        }
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(text: .constant("Search..."), isEditing: .constant(true))
    }
}
