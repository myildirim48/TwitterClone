//
//  ProfileViewModel.swift
//  TwitterClone
//
//  Created by YILDIRIM on 3.05.2023.
//

import Foundation
class ProfileViewModel: ObservableObject {
    
    @Published var tweets = [Tweet]()
    @Published var likedTweets = [Tweet]()
    let user: User
    
    private let tweetService = TweetService()
    private let userService = UserService()
    
    init(user: User){
        self.user = user
        self.fetchUserTweets()
        self.fetchLikedTweets()
    }
    
    var actionButtonTitle: String {
        return user.isCurrentUser ? "Edit Profile" : "Follow"
    }
    
    func tweets(forFilter filter: TwitterFilterViewModel) -> [Tweet] {
        switch filter {
        case .tweets:
            return tweets
        case .replies:
            return tweets
        case .likes:
            return likedTweets
        }
    }
    
    func fetchUserTweets() {
        guard let uid = user.id else { return }
        
        tweetService.fetchTweets(forUid: uid) { tweets in
            self.tweets = tweets
            
            for i in 0 ..< tweets.count {
                self.tweets[i].user = self.user
            }
        }
    }
    
    func fetchLikedTweets() {
        guard let uid = user.id else { return }

        tweetService.fetchLikedTweets(uid) { tweets in
            
                self.likedTweets = tweets
                
                for i in 0 ..< tweets.count{
                    let uid = tweets[i].uid
                    self.userService.fethUser(withUid: uid) { user in
                        self.likedTweets[i].user = user
                    }
                
            }
        }
    }
}
