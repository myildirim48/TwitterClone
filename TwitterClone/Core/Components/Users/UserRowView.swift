//
//  UserRowView.swift
//  TwitterClone
//
//  Created by YILDIRIM on 29.04.2023.
//

import SwiftUI

struct UserRowView: View {
    var body: some View {
        HStack(spacing: 12) {
            Circle()
                .frame(width: 48, height: 48)
            VStack(alignment: .leading,spacing: 4) {
                Text("joker")
                    .font(.subheadline.bold())
                    .foregroundColor(.black)
                
                Text("Head Ladger")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            
            Spacer()
        }.padding(.horizontal)
            .padding(.vertical,4 )
    }
}

struct UserRowView_Previews: PreviewProvider {
    static var previews: some View {
        UserRowView()
    }
}
