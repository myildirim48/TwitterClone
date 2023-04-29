//
//  SideMenuView.swift
//  TwitterClone
//
//  Created by YILDIRIM on 29.04.2023.
//

import SwiftUI

struct SideMenuView: View {
    var body: some View {

        VStack(alignment: .leading,spacing: 32) {
            VStack(alignment: .leading) {
                Circle()
                    .frame(width: 48, height: 48)
                
                VStack(alignment: .leading,spacing: 4) {
                    Text("Bruce Wayne")
                        .font(.headline)
                    
                    Text("@batman")
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
                        ProfileView()
                            
                    } label: {
                        SideMenuOptionRowView(item: item)
                    }
                }else if item == .logout{
                    Button {
                        print("Log out handle")
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

struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SideMenuView()
        }
    }
}
