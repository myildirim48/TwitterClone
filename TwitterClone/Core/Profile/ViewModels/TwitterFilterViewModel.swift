//
//  TwitterFilterViewModel.swift
//  TwitterClone
//
//  Created by YILDIRIM on 29.04.2023.
//

import Foundation
enum TwitterFilterViewModel:Int, CaseIterable {
    case tweets
    case replies
    case likes
    
    var title: String {
        switch self {
        case .tweets:
            return "Tweets"
        case .replies:
            return "Replies"
        case .likes:
            return "Likes"
        }
    }
}
