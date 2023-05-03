//
//  UserRowView.swift
//  TwitterClone
//
//  Created by YILDIRIM on 29.04.2023.
//

import SwiftUI

struct UserRowView: View {
    let user: User
    var body: some View {
        HStack(spacing: 12) {
            LoadableImage(imgUrl: user.profileImageUrl,size: 48)
                
            VStack(alignment: .leading,spacing: 4) {
                Text("@\(user.username)")
                    .font(.subheadline.bold())
                    .foregroundColor(.black)
                
                Text(user.fullname)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            
            Spacer()
        }.padding(.horizontal)
            .padding(.vertical,4 )
    }
}

//struct UserRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        UserRowView(user: User)
//    }
//}
