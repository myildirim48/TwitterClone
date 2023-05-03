//
//  ExploreViewModel.swift
//  TwitterClone
//
//  Created by YILDIRIM on 3.05.2023.
//

import Foundation
class ExploreViewModel: ObservableObject {
    @Published var users = [User]()
    @Published var searchText = ""
    let service = UserService()
    
    var searchableUsers: [User] {
        if searchText.isEmpty {
            return users
        }else {
            let query = searchText.lowercased()
            
            return users.filter{(
                $0.username.contains(query) ||
                $0.fullname.lowercased().contains(query)
            )}
        }
    }
    
    init() {
        fetchUsers()
    }
    
    func fetchUsers() {
        service.fetchUsers { users in
            self.users = users
        }
    }
}
