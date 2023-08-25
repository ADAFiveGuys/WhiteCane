//
//  ShelterRoute.swift
//  WhiteCane
//
//  Created by A_Mcflurry on 2023/08/25.
//

import SwiftUI

struct ShelterRoute: View {
    var body: some View {
        VStack {
            Spacer()
            Text("현재 위치를 기반으로 가장\n가까운 대피소로 안내합니다")
                .font(.title)
                .fontWeight(.semibold)
                .padding()
            
            Text("현재 위치는")
                .font(.title2)
                .fontWeight(.semibold)
            
            RoundedRectangle(cornerRadius: 40)
                .stroke(Color.yellowCustom)
                .frame(width: 342, height: 134)
                .overlay {
                    Text("현재 위치")
                        .font(.title2)
                }
                .padding(.bottom)
            
            Text("가까운 대피소는")
                .font(.title2)
                .fontWeight(.semibold)
            
            RoundedRectangle(cornerRadius: 40)
                .stroke(Color.yellowCustom)
                .frame(width: 342, height: 134)
                .overlay {
                    Text("가까운 대피소 위치\n약 0.0km")
                        .font(.title2)
                }
            
            Spacer()
            
            NavigationLinkView(text: "안내 시작", destination: ContentView())
                .frame(height: 167)
                
                
        }.multilineTextAlignment(.center)
    }
}

struct ShelterRoute_Previews: PreviewProvider {
    static var previews: some View {
        ShelterRoute()
            .preferredColorScheme(.dark)
    }
}
