//
//  UserService.swift
//  TwitterClone
//
//  Created by YILDIRIM on 2.05.2023.
//

import Firebase
import FirebaseFirestoreSwift

struct UserService {
    func fethUser(withUid uid: String,completion: @escaping(User) -> Void) {
        Firestore.firestore().collection("users")
            .document(uid)
            .getDocument { snapshot, _ in
                guard let snapshot else { return }
                
                guard let user = try? snapshot.data(as: User.self) else { return }
                completion(user)
            }
    }
    
    func fetchUsers(completion: @escaping([User]) -> Void) {
        Firestore.firestore().collection("users")
            .getDocuments { snapshot, err in
                guard let document = snapshot?.documents else { return }
                let users = document.compactMap { try? $0.data(as: User.self) }
                completion(users)
            }
    }
}
