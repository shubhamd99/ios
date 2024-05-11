//
//  ContentView.swift
//  TodoList
//
//  Created by shubham.dhage on 11/05/24.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewViewModel()
    
    var body: some View {
        if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty {
            // signed in
            accountView
        } else {
            LoginView()
        }
    }
    
    // Abstract
    @ViewBuilder
    var accountView: some View {
        TabView {
            TabView {
                TodoListView(userId: viewModel.currentUserId)
                    .tabItem {
                        Label("Home", systemImage: "house")
                    }
                
                ProfileView()
                    .tabItem {
                        Label("Profile", systemImage: "person.circle")
                    }
            }
        }
    }
}

#Preview {
    MainView()
}
