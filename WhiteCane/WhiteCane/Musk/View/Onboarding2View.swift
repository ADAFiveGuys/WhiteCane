//
//  Onboarding2.swift
//  WhiteCane
//
//  Created by A_Mcflurry on 2023/08/25.
//1c

import SwiftUI

struct Onboarding2View: View {
    var body: some View {
        VStack {
            Text("안전지팡이가 처음이신가요?")
                .fontWeight(.semibold)
                .font(.title)
                .padding(.top)
                .padding()
            Text("응급 상황에 대비하기 위해,\n건강정보카드를 미리 작성하는걸 추천드려요!")
            
            Spacer()
            

            NavigationLinkView(text: "입력하기", destination: ContentView())
                .frame(height: 167)
                .padding(.vertical, 30)
            NavigationLinkView(text: "나중에 하기", destination: ContentView())
                .frame(height: 167)
        }.multilineTextAlignment(.center)
            .navigationBarBackButtonHidden()
    }
        
}

struct Onboarding2_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            Onboarding2View()
                .preferredColorScheme(.dark)
            
        }
    }
}
