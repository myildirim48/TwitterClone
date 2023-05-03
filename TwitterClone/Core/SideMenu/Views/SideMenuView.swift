//
//  SideMenuView.swift
//  TwitterClone
//
//  Created by YILDIRIM on 29.04.2023.
//

import SwiftUI

struct SideMenuView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    var body: some View {
        if let user = authViewModel.currentUser {
            
        VStack(alignment: .leading,spacing: 32) {
            VStack(alignment: .leading) {
                 
                LoadableImage(imgUrl: user.profileImageUrl)
                
                VStack(alignment: .leading,spacing: 4) {
                    Text(user.fullname)
                        .font(.headline)
                    
                    Text("@\(user.username)")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                
                UserStatsView()
                    .padding(.vertical)
            }.padding(.leading)
            
            //            List
            
            ForEach(SideMenuViewModel.allCases, id:\.rawValue) { item in
                
                if item == .profile {
                    NavigationLink {
                        ProfileView(user: user)
                        
                    } label: {
                        SideMenuOptionRowView(item: item)
                    }
                }else if item == .logout{
                    Button {
                        authViewModel.logOut()
                    } label: {
                        SideMenuOptionRowView(item: item)
                    }
                    
                }else {
                    SideMenuOptionRowView(item: item)
                }
                
                
            }
            
            Spacer()
        }
    }
    }
}

struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SideMenuView()
        }
    }
}

