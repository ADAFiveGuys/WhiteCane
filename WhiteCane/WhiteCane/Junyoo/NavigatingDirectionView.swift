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
				Text("e편한세상울산역어반스퀘어\n지하2층 대피소")
					.padding()
					.font(.title2)
					.fontWeight(.semibold)
					.multilineTextAlignment(.center)
				
				Text("약 \(locationManager.distance.toKilometers) 남았어요")
					.font(.title2)
					.padding()
				
				Text("\(locationManager.navigatorDistance) \(locationManager.navigator.filteredString())")
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
							Image(systemName: {
									if locationManager.nextNavigator.contains("좌회전") {
										return "arrow.turn.up.left"
									} else if locationManager.nextNavigator.contains("우회전") {
										return "arrow.turn.up.right"
									} else { return "arrow.up" }
								}())
								.font(.largeTitle)
								.padding(.bottom)
								.fontWeight(.heavy)
							Text("다음은 \(locationManager.nextNavigator)")
								.font(.headline)
								.fontWeight(.semibold)
						}
					}
					.frame(height: 135)
					.padding()
			}
			.foregroundColor(.white)
			
			if locationManager.distance < 5 {
				NearShelterView()
			}
		}
		.onAppear {
			locationManager.startUpdating()
		}
		.onDisappear {
			locationManager.stopUpdating()
		}
	}
}

extension String {
	func filteredString() -> String {
		var newInstruction = self

		if self.contains("다리 위로 걸어가기") {
			newInstruction = self.replacingOccurrences(of: ".* 다리 위로 걸어가기", with: "다리 건너기", options: .regularExpression)
		} else if self.contains("계속 이동") {
			newInstruction = self.replacingOccurrences(of: ".* 계속 이동", with: "직진", options: .regularExpression)
		} else if self.contains("우회전") {
			newInstruction = self.replacingOccurrences(of: ".* 우회전", with: "우회전", options: .regularExpression)
		} else if self.contains("좌회전") {
			newInstruction = self.replacingOccurrences(of: ".* 좌회전", with: "좌회전", options: .regularExpression)
		}
		
		return newInstruction
	}
}

extension Double {
	var toKilometers: String {
		if self >= 1000 {
			return "\(String(format: "%.1f", self / 1000)) km"
		} else {
			return "\(Int(self)) m"
		}
	}
}

struct NavigatingDirectionView_Previews: PreviewProvider {
	static var previews: some View {
		NavigatingDirectionView()
	}
}
