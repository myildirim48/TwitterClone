//
//  ExploreView.swift
//  TwitterClone
//
//  Created by YILDIRIM on 29.04.2023.
//

import SwiftUI

struct ExploreView: View {
    @ObservedObject var viewModel = ExploreViewModel()
    
    
    var body: some View {
        
            VStack {
                SearchBar(text: $viewModel.searchText)
                    .padding()
                ScrollView {
                    LazyVStack {
                        ForEach(viewModel.searchableUsers) { user in
                            NavigationLink {
                                ProfileView(user: user)
                            } label: {
                                UserRowView(user: user)
                            }

                        }
                    }
                }
            }
            .navigationTitle("Search")
            .navigationBarTitleDisplayMode(.inline)
        
    }
}

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ExploreView()
        }
    }
}
