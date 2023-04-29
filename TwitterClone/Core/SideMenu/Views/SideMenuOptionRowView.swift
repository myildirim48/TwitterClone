//
//  SideMenuOptionRowView.swift
//  TwitterClone
//
//  Created by YILDIRIM on 29.04.2023.
//

import SwiftUI

struct SideMenuOptionRowView: View {
    var item: SideMenuViewModel
    var body: some View {
        HStack(spacing: 16){
            Image(systemName: item.imageName)
                .font(.headline)
                .foregroundColor(.gray)
            
            Text(item.title)
                .foregroundColor(.black)
                .font(.subheadline)
            
            Spacer()
        }.frame(height: 40)
            .padding(.horizontal)
    }
}

struct SideMenuOptionRowView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuOptionRowView(item: .bookmarks)
    }
}
