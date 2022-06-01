//
//  MainTabView.swift
//  instagramClone
//
//  Created by berk tuna on 16/05/2022.
//

import SwiftUI

struct MainTabView: View {
    var user: User
    var body: some View {
        NavigationView {
            TabView   {
            
            FeedView()
                .tabItem {
                    Image(systemName: "house")
                }
            
            SearchView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }
            UploadPostView()
                .tabItem {
                    Image(systemName: "plus.square")
                }
            NotificationsView()
                .tabItem {
                    Image(systemName: "heart")
                }
            ProfileView(user: user)
                .tabItem {
                    Image(systemName: "person")
                }
        }
        
        .navigationTitle("Home")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarItems(trailing: logoutButton)
        .accentColor(.black)
        }
    }
    var logoutButton: some View{
        Button{
            AuthViewModel.shared.signout()
        }
            label: {
                Text("Logout")
                    .font(.system(size: 13, weight: .semibold))
                    .foregroundColor(.blue)
            }
    }
}
