//
//  NewTweetView.swift
//  TwitterClone
//
//  Created by YILDIRIM on 29.04.2023.
//

import SwiftUI

struct NewTweetView: View {
    @State private var caption = ""
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var authViewModel: AuthViewModel
    @ObservedObject var viewModel = NewTweetViewModel()
    
    var body: some View {
        VStack {
            HStack {
                Button {
                    dismiss()
                } label: {
                    Text("Cancel")
                        .foregroundColor(Color(.systemBlue))
                }
                
                Spacer()
                
                Button {
                    viewModel.uploadTweet(withCaption: caption)
                } label: {
                    Text("Tweet")
                        .bold()
                        .padding(.horizontal)
                        .padding(.vertical,8)
                        .background(Color(.systemBlue))
                        .foregroundColor(.white)
                        .clipShape(Capsule())
                }

            }.padding()
            HStack(alignment: .top) {
                if let user = authViewModel.currentUser {
                    LoadableImage(imgUrl: user.profileImageUrl,size: 64)
                }
                
                TextArea(placeholder: "What's happening?", text: $caption)
                
            }.padding()
        }.onReceive(viewModel.$didUploadTweet) { success in
            if success{
                dismiss()
            }
        }
    }
}

struct NewTweetView_Previews: PreviewProvider {
    static var previews: some View {
        NewTweetView()
    }
}
