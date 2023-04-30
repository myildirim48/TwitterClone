//
//  PhotoSelecterView.swift
//  TwitterClone
//
//  Created by YILDIRIM on 30.04.2023.
//

import SwiftUI

struct ProfilePhotoSelectView: View {
    var body: some View {
        VStack {
            AuthenticationHeaderView(title1: "Create your account",
                                     title2: "Add a profile photo")
            
            
            Button {
                
            } label: {
                Image(systemName: "person.crop.circle.badge.plus")
                    .resizable()
                    .renderingMode(.original)
                    .foregroundColor(Color(.systemBlue))
                    .scaledToFill()
                    .frame(width: 130, height: 120)
                    .padding(.top,44)
            }

            Spacer()
            
        }
        .ignoresSafeArea()
    }
}

struct PhotoSelecterView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePhotoSelectView()
    }
}
