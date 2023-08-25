//
//  NavigatingDirectionView.swift
//  WhiteCane
//
//  Created by Junyoo on 2023/08/26.
//

import SwiftUI

struct NavigatingDirectionView: View {
	@EnvironmentObject var locationManager: LocationManager

	var body: some View {
		ZStack {
			Color.black.ignoresSafeArea()
			
			VStack {
				Text("목적지 대피소")
					.padding()
					.font(.title2)
					.fontWeight(.semibold)
				
				Text("약 0.4Km 남았어요")
					.font(.title2)
					.padding()
				
				Text(locationManager.navigator)
					.font(.title)
					.fontWeight(.semibold)

				Spacer()
				
				Image(systemName: "arrow.up")
					.rotationEffect(Angle(degrees: locationManager.bearing))
					.font(.system(size: 100))
					.fontWeight(.heavy)
					.foregroundColor(locationManager.correctDirection ? .yellow : .white)
				
				Spacer()
				
				RoundedRectangle(cornerRadius: 40)
					.stroke(Color.yellow, lineWidth: 5)
					.overlay {
						VStack {
							Image(systemName: "arrow.turn.up.left")
								.font(.largeTitle)
							Text("다음은 좌회전 입니다")
						}
					}
					.frame(height: 100)
					.padding()
			}
			.foregroundColor(.white)
		}
	}
}

struct NavigatingDirectionView_Previews: PreviewProvider {
	static var previews: some View {
		NavigatingDirectionView()
	}
}
