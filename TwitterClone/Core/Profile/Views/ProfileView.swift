//
//  ProfileView.swift
//  TwitterClone
//
//  Created by YILDIRIM on 29.04.2023.
//

import SwiftUI

struct ProfileView: View {
    
    @State private var selectedFilter: TwitterFilterViewModel = .tweets
    @Namespace var animation
    @Environment(\.dismiss) var dismiss
    
    @ObservedObject var viewModel: ProfileViewModel
    
    init(user:User){
        self.viewModel = ProfileViewModel(user: user)
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            headerView
            
            actionButtons
            
            userInfoDetails
            
            tweetFilterBar
            
            tweetsView
         
            Spacer()
        }
        .toolbar(.hidden)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(user: User(id: NSUUID().uuidString,
                               username: "Mamiko",
                               fullname: "Fullname Mami",
                               profileImageUrl: "asd",
                               email: "test@email.com"))
    }
}

extension ProfileView {
    var headerView: some View {
        ZStack(alignment: .bottomLeading) {
            Color(.systemBlue)
                .ignoresSafeArea()
            
            VStack {
                
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "arrow.left")
                        .resizable()
                        .frame(width: 20, height: 16)
                        .foregroundColor(.white)
                        .offset(x: 12, y: -4)
                }
                
                
                LoadableImage(imgUrl: viewModel.user.profileImageUrl,size: 72)
                    .offset(x: 16,y: 24)
            }
        }
        .frame(height: 96)
    }
    
    var actionButtons: some View {
        
        HStack(spacing: 12) {
            Spacer()
            
            Image(systemName: "bell.badge")
                .font(.title3)
                .padding(6)
                .overlay(Circle().stroke(Color.gray, lineWidth: 0.75))
            
            Button {
                
            } label: {
                Text(viewModel.actionButtonTitle)
                    .font(.subheadline.bold())
                    .frame(width: 120, height: 32)
                    .foregroundColor(.black)
                    .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.gray, lineWidth: 0.75))
                
                
            }
            
        }.padding(.trailing)
    }
    
    var userInfoDetails: some View {
        VStack(alignment: .leading,spacing: 4) {
            HStack {
                Text(viewModel.user.fullname)
                    .font(.title2.bold())
                
                Image(systemName: "checkmark.seal.fill")
                    .foregroundColor(Color(.systemBlue))
            }
            
            Text("@\(viewModel.user.username)")
                .font(.subheadline)
                .foregroundColor(.gray)
            
            Text("Your moms favorite villain")
                .font(.subheadline)
                .padding(.vertical)
            
            HStack(spacing: 24) {
                HStack {
                    Image(systemName: "mappin.and.ellipse")
                    
                    Text("Gottam, NY")
                }
                
                HStack {
                    Image(systemName: "link")
                    
                    Text("www.joker.com")
                }
            }.foregroundColor(.gray)
                .font(.caption)
            
            UserStatsView()
            
        }.padding(.horizontal)
        
    }
    
    var tweetFilterBar: some View {
        
        HStack {
            ForEach(TwitterFilterViewModel.allCases, id: \.rawValue) { item in
                VStack {
                    Text(item.title)
                        .font(.subheadline)
                        .fontWeight(selectedFilter == item ? .semibold : .regular)
                        .foregroundColor(selectedFilter == item ? .black : .gray)
                    
                    if selectedFilter == item{
                        Capsule()
                            .foregroundColor(Color(.systemBlue))
                            .frame(height: 3)
                            .matchedGeometryEffect(id: "filter", in: animation)
                    }else {
                        Capsule()
                            .foregroundColor(Color(.clear))
                            .frame(height: 3)
                    }
                }.onTapGesture {
                    withAnimation(.easeOut) {
                        self.selectedFilter = item
                    }
                }
            }
        }.overlay {
            Divider()
                .offset(x: 0, y: 16)
        }
        
    }
    
    var tweetsView: some View {
        ScrollView {
            LazyVStack {
                ForEach(viewModel.tweets(forFilter: self.selectedFilter)) { tweet in
                    TweetRowView(tweet: tweet)
                        .padding()
                }
            }
        }
    }
}
