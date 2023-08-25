//
//  TextFieldView.swift
//  WhiteCane
//
//  Created by A_Mcflurry on 2023/08/25.
//

import SwiftUI

struct TextFieldView: View {
    
    enum textFieldKind: String {
        case name = "이름"
        case house = "집주소"
        case phone = "긴급연락"
    }
    
    let kind: textFieldKind
    @Binding var text: String
    var body: some View {
        
        HStack {
            Text(kind.rawValue+":")
                .font(Font.custom("SF Pro Text", size: 30).weight(.semibold))
                .foregroundColor(.white)
                .multilineTextAlignment(.leading)
                .padding(.leading)
                .padding(.leading)
            Spacer()
            TextField("", text: $text)
                .font(Font.custom("SF Pro Text", size: 30).weight(.semibold))
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
        TextFieldView(kind: .name, text: .constant("들린매들린매들린매"))
    }
}
