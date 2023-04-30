//
//  LoginView.swift
//  TwitterClone
//
//  Created by YILDIRIM on 30.04.2023.
//

import SwiftUI

struct LoginView: View {
    
    @State private var email = ""
    @State private var password = ""
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
//        Parent container
        VStack {
//            header
      AuthenticationHeaderView(title1: "Hello.", title2: "Welcome Back")
            
            VStack(spacing: 40) {
                CustomInputField(imageName: "envelope",
                                 placeholderText: "Email",
                                 text: $email)
                CustomInputField(imageName: "lock",
                                 placeholderText: "Password",
                                 text: $password,
                                 isSecureField: true)
            }
            .padding(.horizontal,32)
            .padding(.top,44)
            
            HStack {
                Spacer()
                
                NavigationLink {
                    Text("Reset password view")
                } label: {
                    Text("Forgot password ?")
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(Color(.systemBlue))
                        .padding(.top)
                        .padding(.trailing,24)
                }
            }
            
            Button {
                viewModel.login(withEmail: email, password: password)
            } label: {
                Text("Sign In")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(width: 340, height: 50)
                    .background(Color(.systemBlue))
                    .clipShape(Capsule())
                    .padding()
            }
            .shadow(color: .gray.opacity(0.5), radius: 10)

            Spacer()
            
            NavigationLink {
                RegistrationView()
                    .toolbar(.hidden)
            } label: {
                HStack {
                    Text("Don't have an account?")
                        .font(.caption)
                    Text("Sing Up.")
                        .bold()
                        .font(.footnote)
                }
                .foregroundColor(Color(.systemBlue))

            }.padding(.bottom, 32)
        }.ignoresSafeArea()
            .toolbar(.hidden)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            LoginView()
        }
    }
}
