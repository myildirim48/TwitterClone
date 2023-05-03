//
//  ContentView.swift
//  TwitterClone
//
//  Created by YILDIRIM on 29.04.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var showMenu = false
    @State private var visibility: Visibility = .visible
    @EnvironmentObject var viewModel: AuthViewModel
    var body: some View {
        Group {
            if viewModel.userSession == nil {
                LoginView()
            }else {
                mainInterfaceView
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ContentView()
        }
    }
}

    extension ContentView {
        var mainInterfaceView: some View {
            ZStack(alignment: .topLeading) {
                    MainTabView()
                        .toolbar(visibility)
            
            if showMenu {
                ZStack {
                    Color(.black)
                        .opacity(showMenu ? 0.25 : 0.0)
                }.onTapGesture {
                    withAnimation(.easeInOut){
                        showMenu = false
                    }
                    visibility = .visible
                }
                .ignoresSafeArea()
            }
            
            SideMenuView()
                .frame(width: 300)
                .offset(x: showMenu ? 0 : -300)
                .background(showMenu ? .white : .clear )
                
        }

        .navigationTitle("Home")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    withAnimation(.easeInOut){
                        showMenu.toggle()
                    }
                    visibility = .hidden
                        
                } label: {
                    if let user = viewModel.currentUser {
                        LoadableImage(imgUrl: user.profileImageUrl, size: 36)
                            .padding(.leading,8)
                    }
                }
            }
        }
        .onAppear(perform: {
            showMenu = false
        })
        }
    }
