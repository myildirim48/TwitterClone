//
//  NewTweetView.swift
//  TwitterClone
//
//  Created by YILDIRIM on 29.04.2023.
//

import SwiftUI

struct NewTweetView: View {
    @State private var caption = ""
    var body: some View {
        VStack {
            HStack {
                Button {
                    print("Dissmis")
                } label: {
                    Text("Cancel")
                        .foregroundColor(Color(.systemBlue))
                }
                
                Spacer()
                
                Button {
                    print("Dissmis")
                } label: {
                    Text("Tweet")
                        .bold()
                        .padding(.horizontal)
                        .padding(.vertical,8)
                        .background(Color(.systemBlue))
                        .foregroundColor(.white)
                        .clipShape(Capsule())
                }

            }
            HStack(alignment: .top) {
                Circle()
                    .frame(width: 64, height: 64)
                
                TextArea(placeholder: "What's happening?", text: $caption)
                
            }.padding()
        }
    }
}

struct NewTweetView_Previews: PreviewProvider {
    static var previews: some View {
        NewTweetView()
    }
}