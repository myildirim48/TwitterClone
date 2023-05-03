//
//  RegistrationView.swift
//  TwitterClone
//
//  Created by YILDIRIM on 30.04.2023.
//

import SwiftUI

struct RegistrationView: View {
    @State private var email = ""
    @State private var username = ""
    @State private var fullname = ""
    @State private var password = ""
    @EnvironmentObject var viewModel: AuthViewModel    
    @Environment(\.dismiss) var dissmis
    var body: some View {
        
        

        NavigationStack{
        VStack {

            AuthenticationHeaderView(title1: "Get started.", title2: "Create your account")

            VStack(spacing: 40) {
                CustomInputField(imageName: "envelope",
                                 placeholderText: "Email",
                                 text: $email)
                CustomInputField(imageName: "person",
                                 placeholderText: "Username",
                                 text:$username)
                CustomInputField(imageName: "person",
                                 placeholderText: "Full name",
                                 text: $fullname)
                CustomInputField(imageName: "lock",
                                 placeholderText: "Password",
                                 text: $password,
                                 isSecureField: true)

            }.padding(32)

            Button {
                viewModel.register(withEmail: email,
                                   password: password,
                                   fullname: fullname,
                                   username: username)

            } label: {
                Text("Sign Up")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(width: 340, height: 50)
                    .background(Color(.systemBlue))
                    .clipShape(Capsule())
                    .padding()
            }
            .shadow(color: .gray.opacity(0.5), radius: 10)

            Spacer()

            Button {
                dissmis()
            } label: {
                HStack {
                    Text("Already have an account?")
                        .font(.footnote)

                    Text("Sign Up")
                        .font(.footnote)
                        .fontWeight(.semibold)
                }
            }.padding(.bottom)
        }
        .ignoresSafeArea()

        .navigationDestination(isPresented: $viewModel.didAuthenticateUser) {
            ProfilePhotoSelectView()
        }
        }
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
