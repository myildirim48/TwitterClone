//
//  AuthViewModel.swift
//  TwitterClone
//
//  Created by YILDIRIM on 30.04.2023.
//

import SwiftUI
import Firebase

class AuthViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    @Published var didAuthenticateUser = false
    @Published var currentUser: User?
    
    private var tempUserSessions: FirebaseAuth.User?
    private let service = UserService()
    
    init() {
        self.userSession = Auth.auth().currentUser
        self.fetchUser()
    }
    
    func login(withEmail email: String, password: String){
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error {
                print("DEBUG: Failed to login with error \(error.localizedDescription)")
                return
            }
            
            guard let user = result?.user else { return }
            self.userSession = user
            self.fetchUser()
        }
    }
    
    func register(withEmail email: String, password:String, fullname: String, username:String){
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error {
                print("DEBUG: Failed to register with error \(error.localizedDescription)")
                return
            }
            
            guard let user = result?.user else { return }
            self.tempUserSessions = user
            
            let data = ["email" : email,
                        "username" : username.lowercased(),
                        "fullname" : fullname,
                        "uid": user.uid]
            
            Firestore.firestore().collection("users")
                .document(user.uid)
                .setData(data) { _ in
                    self.didAuthenticateUser = true
                    print("DEBUG: User auth \(self.didAuthenticateUser)")
                }
        }
    }
    
    func logOut(){
        userSession = nil
        didAuthenticateUser = false
        try? Auth.auth().signOut()
    }
    
    //MARK: -  Helper for image upload
    
    func uploadProfileImage(_ image: UIImage) {
        guard let uid = tempUserSessions?.uid else { return }
        
        ImageUploader.uploadImage(image: image) { profileImageUrl in
            Firestore.firestore().collection("users")
                .document(uid)
                .updateData(["profileImageUrl" : profileImageUrl]) { _ in
                    self.fetchUser()
                    self.userSession = self.tempUserSessions
                }
        }
    }
    
    //MARK: - Fetch user
    
    func fetchUser() {
        guard let uid = self.userSession?.uid else { return }
        
        service.fethUser(withUid: uid) { user in
            self.currentUser = user
        }
    }
}
