//
//  Tweet.swift
//  TwitterClone
//
//  Created by YILDIRIM on 3.05.2023.
//

import Firebase
import FirebaseFirestoreSwift

struct Tweet: Identifiable,Decodable {
    @DocumentID var id: String?
    let caption: String
    let timestamp: Timestamp
    let uid: String
    var likes: Int
    
    var user: User?
    var didLike: Bool? = false
}
