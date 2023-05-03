//
//  NewTweetViewModel.swift
//  TwitterClone
//
//  Created by YILDIRIM on 3.05.2023.
//

import Foundation

class NewTweetViewModel: ObservableObject {
    
    @Published var didUploadTweet = false
    let serivce = TweetService()
    
    func uploadTweet(withCaption caption: String) {
        serivce.uploadTweet(caption: caption) { success in
            if success {
//                dissmis view
                self.didUploadTweet = true
            }else {
//                Show error message to user
            }
        }
    }
}
