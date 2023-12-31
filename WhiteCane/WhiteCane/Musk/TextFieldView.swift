//
//  TextFieldView.swift
//  WhiteCane
//
//  Created by A_Mcflurry on 2023/08/25.
//

import SwiftUI

struct TextFieldView: View {
    
    let kind: String
    @Binding var text: String
    var body: some View {
        
        HStack {
            Text(kind+":")
                .fontWeight(.semibold)
                .font(.title)
                .foregroundColor(.white)
                .multilineTextAlignment(.leading)
                .padding(.leading)
                .padding(.leading)
            Spacer()
            TextField("", text: $text)
                .fontWeight(.semibold)
                .font(.title)
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
            Spacer()
        }
        .background(
            Rectangle()
                .foregroundColor(.clear)
                .frame(width: 342, height: 73)
                .background(.blue)
                .cornerRadius(40)
        )
        
    }
}

struct TextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldView(kind: "name", text: .constant("들린매들린매들린매"))
    }
}
