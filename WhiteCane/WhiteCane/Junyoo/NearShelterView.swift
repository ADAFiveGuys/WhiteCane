//
//  NearShelterView.swift
//  WhiteCane
//
//  Created by Junyoo on 2023/08/26.
//

import SwiftUI

struct NearShelterView: View {
    var body: some View {
		ZStack {
			Color.black.ignoresSafeArea()
			
			VStack {
				Text("대피소 근처에 도착했습니다")
					.padding()
					.font(.title2)
					.fontWeight(.semibold)
				
				Text("출입구 인식을 실행합니다.\n휴대폰 뒷면이 건물쪽을 향하게 해주세요.\n출입구가 발견되면 진동이 울립니다.")
					.font(.title3)
					.padding()
					.multilineTextAlignment(.center)
				
				Spacer()
				
				NavigationLinkView(text: "카메라 실행하기", destination: CameraaView())
					.frame(height: 100)
			}
			.foregroundColor(.white)
		}
	}
}

struct NearShelterView_Previews: PreviewProvider {
    static var previews: some View {
        NearShelterView()
    }
}
