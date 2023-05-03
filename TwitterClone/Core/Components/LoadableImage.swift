//
//  LoadableImage.swift
//  TwitterClone
//
//  Created by YILDIRIM on 2.05.2023.
//

import SwiftUI

struct LoadableImage: View {
    
    let imgUrl: String
    var size: CGFloat = 54
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: imgUrl)) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: size, height: size)
                        .clipShape(Circle())
                        .shadow(color: .gray.opacity(0.5), radius: 5)
                case .failure:
                    emptyImage
                @unknown default:
                    emptyImage
                }
            }
        }

    }
}

struct LoadableImage_Previews: PreviewProvider {
    static var previews: some View {
        LoadableImage(imgUrl: "asd")
    }
}

extension LoadableImage {
    var emptyImage: some View {
        Image(systemName: "person.circle.fill")
            .resizable()
            .scaledToFill()
            .frame(width: 48, height: 48)
            .clipShape(Circle())
            .shadow(color: .gray.opacity(0.5), radius: 5)
    }
    
}
