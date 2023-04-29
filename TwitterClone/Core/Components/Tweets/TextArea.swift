//
//  TextArea.swift
//  TwitterClone
//
//  Created by YILDIRIM on 29.04.2023.
//

import SwiftUI

struct TextArea: View {
    @Binding var text: String
    let placeholder: String
    
    init(placeholder: String, text: Binding<String> ) {
        self._text = text
        self.placeholder = placeholder
    }
    var body: some View {
        ZStack(alignment: .topLeading) {
            
            TextEditor(text: $text)
                .padding(4)
            if text.isEmpty{
            
                Text(placeholder)
                    .foregroundColor(.gray)
                .padding(.horizontal,8)
                .padding(.vertical,12)
                
            }
            
        }
        .font(.body)

    }
}
