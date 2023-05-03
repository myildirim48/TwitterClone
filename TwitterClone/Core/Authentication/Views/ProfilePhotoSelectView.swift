//
//  PhotoSelecterView.swift
//  TwitterClone
//
//  Created by YILDIRIM on 30.04.2023.
//

import SwiftUI
import PhotosUI

struct ProfilePhotoSelectView: View {
    
    @State var selectedItems: [PhotosPickerItem] = []
    @State var data: Data?
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        VStack {
            AuthenticationHeaderView(title1: "Create your account",
                                     title2: "Add a profile photo")
            
        if data == nil {
            PhotosPicker(selection: $selectedItems,
                         maxSelectionCount: 1,
                         matching: .images) {
                
                    Image(systemName: "person.crop.circle.badge.plus")
                        .resizable()
                        .renderingMode(.original)
                        .modifier(ProfileImageModifier())
                
            }.onChange(of: selectedItems) { item in
                guard let item = selectedItems.first else { return }
                item.loadTransferable(type: Data.self) { result in
                    switch result {
                    case .success(let data):
                        if let data {
                            self.data = data
                        }else {
                            print("DEBUG : Profile photo is nil.")
                            
                        }
                    case .failure(let error):
                        fatalError("Fatal error at profile photo error: \(error.localizedDescription)")
                    }
                }
            }
        }else if let data, let uiimage = UIImage(data: data){
                Image(uiImage: uiimage)
                    .resizable()
                    .modifier(ProfileImageModifier())
                    .clipShape(Circle())
                    .padding(.top,44)
            
            Button {
                viewModel.uploadProfileImage(uiimage)
            } label: {
                Text("Continue")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(width: 340, height: 50)
                    .background(Color(.systemBlue))
                    .clipShape(Capsule())
                    .padding()
            }
            .shadow(color: .gray.opacity(0.5), radius: 5)

            
        }
            Spacer()
            
        }
        .ignoresSafeArea()
    }
}


struct PhotoSelecterView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePhotoSelectView()
    }
}

private struct ProfileImageModifier: ViewModifier {
   func body(content: Content) -> some View {
       content
           .foregroundColor(Color(.systemBlue))
           .scaledToFill()
           .frame(width: 130, height: 120)
           .shadow(color: .gray.opacity(0.5), radius: 10)
       
   }
}
