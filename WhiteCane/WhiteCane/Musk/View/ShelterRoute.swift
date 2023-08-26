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
            Text("현재 위치를 기반으로 가장\n가까운 대피소로 안내합니다.")
                .font(.title)
                .fontWeight(.semibold)
                .padding()
            
            Text("현재 위치는")
                .font(.title2)
                .fontWeight(.semibold)
                .padding(.bottom)
            
            RoundedRectangle(cornerRadius: 40)
                .stroke(Color.yellowCustom)
                .frame(width: 342, height: 134)
                .overlay {
                    Text("울산전시컨벤션센터")
                        .font(.title2)
                }
                .padding(.bottom)
            
            Text("가까운 대피소는")
                .font(.title2)
                .fontWeight(.semibold)
                .padding(.bottom)
            
            RoundedRectangle(cornerRadius: 40)
                .stroke(Color.yellowCustom)
                .frame(width: 342, height: 134)
                .overlay {
					VStack {
						Text("e편한세상울산역어반스퀘어\n지하2층 대피소")
							.multilineTextAlignment(.center)
							.font(.title2)
						Text("약 2.0km")
							.font(.title2)
					}
                }
            
            Spacer()
            
			NavigationLinkView(text: "안내 시작하기", destination: NavigatingDirectionView())
                .frame(height: 100)
        }.multilineTextAlignment(.center)
    }
}

struct ShelterRoute_Previews: PreviewProvider {
    static var previews: some View {
        ShelterRoute()
            .preferredColorScheme(.dark)
    }
}
