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
            
            NavigationLinkView(text: "지진", destination: EarthquakeGuide())
                .frame(height: 100)
                .padding(.bottom)
            
            NavigationLinkView(text: "전쟁", destination: WarGuide())
                .frame(height: 100)
            
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
