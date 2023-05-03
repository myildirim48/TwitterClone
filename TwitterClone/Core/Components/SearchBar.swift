//
//  SearchBar.swift
//  TwitterClone
//
//  Created by YILDIRIM on 3.05.2023.
//

import SwiftUI

struct SearchBar: View {
    @Binding var text: String
    
    var body: some View {
        HStack {
         TextField("Search...", text: $text)
                .padding(12)
                .padding(.leading,16)
                .background(Color(.systemGray6))
                .padding(.horizontal,6)
                .cornerRadius(12)
                .overlay {
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading,12)
                    }
                    
                }
                .shadow(color: .gray.opacity(0.5), radius: 5)
              
        }.padding(.horizontal,4)
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(text: .constant(""))
            .previewLayout(.sizeThatFits)
    }
}
