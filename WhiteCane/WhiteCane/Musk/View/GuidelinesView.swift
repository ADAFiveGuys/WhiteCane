//
//  GuidelinesView.swift
//  WhiteCane
//
//  Created by A_Mcflurry on 2023/08/25.
//

import SwiftUI

struct GuidelinesView: View {
    var body: some View {
        VStack {
            Text("재난 상황별 행동 요령")
                .font(.title)
                .fontWeight(.semibold)
                .padding(.top)
                .padding(.top)
                .padding(.top)
            Spacer()
            
            NavigationLinkView(text: "지진", destination: ContentView())
                .frame(height: 167)
                .padding(.bottom)
            
            NavigationLinkView(text: "전쟁", destination: ContentView())
                .frame(height: 167)
            
        }
    }
}

struct GuidelinesView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            GuidelinesView()
                .preferredColorScheme(.dark)
        }
    }
}
