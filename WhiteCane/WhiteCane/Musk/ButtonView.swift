//
//  ButtonView.swift
//  WhiteCane
//
//  Created by A_Mcflurry on 2023/08/25.
//

import SwiftUI

// color없이 선언하면 노란색, color를 지정해주면 지정한 색이 나오게 된다. 프리뷰 확인요망.

struct ButtonView: View {
    let text: String
    var color: Color? = nil
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            ZStack {
                Rectangle()
                    .cornerRadius(40)
                    .foregroundColor(color == nil ? .yellowCustom : color)
                    .padding(.horizontal, 24)
                Text(text)
                    .font(Font.custom("SF Pro Text", size: 30).weight(.semibold))
                    .foregroundColor(.black)
                    
            }
        }
    }
}

struct Button_Preview: PreviewProvider {
    static var previews: some View {
        VStack {
            ButtonView(text: "Test") {
                print("하핫")
            }
            ButtonView(text: "Hello Five Guys!", color: .redCustom) {
                print("코딩은 즐거워")
            }
        }
    }
}
