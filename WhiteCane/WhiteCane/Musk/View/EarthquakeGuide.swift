//
//  EarthquakeGuide.swift
//  WhiteCane
//
//  Created by A_Mcflurry on 2023/08/25.
//

import SwiftUI

struct EarthquakeGuide: View {
    @State private var isPress: Bool = false
    var body: some View {
        VStack {
            Text("지진 발생 시 행동 요령")
                .font(.title)
                .fontWeight(.semibold)
                .padding()
            
            
            HStack(spacing: 0) {
                Button {
                    isPress = false
                } label: {
                    Rectangle()
                        .stroke(Color.yellowCustom, lineWidth: 2)
                        .frame(width: 170, height: 60)
                        .overlay {
                            Text("지진 발생 실내")
                                .foregroundColor(.white)
                                .font(.title2)
                                .fontWeight(.semibold)
                        }
                }
                
                Button {
                    isPress = true
                } label: {
                    Rectangle()
                        .stroke(Color.yellowCustom, lineWidth: 2)
                        .frame(width: 170, height: 60)
                        .overlay {
                            Text("지진 발생 실외")
                                .foregroundColor(.white)
                                .font(.title2)
                                .fontWeight(.semibold)
                        }
                }
            }
            .padding(.bottom)
            if(!isPress){
                Text("지진 발생 시 실내의 경우")
                    .font(.title3)
                    .fontWeight(.semibold)
            }
            else{
                Text("지진 발생 시 실외의 경우")
                    .font(.title3)
                    .fontWeight(.semibold)
            }
            
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    if !isPress {
                        Text("방석, 가방, 점퍼 등으로 머리를 보호하고 탁자 아래로 들어가 탁자 다리를 붙잡습니다.")
                        Text("탁자 아래로 대피 불가능하면 머리를 보호하고 가구와 창문에서 벗어나 안전한 곳으로 이동합니다.")
                        Text("흔들림이 멈출 때까지 기다립니다.")
                        Text("흔들림이 멈춘 후 건물 밖으로 빠르게 대피합니다. 신발을 착용해 유리 조각 및 파편에 대비합니다.")
                        Text("안전한 장소에서 라디오 등 안내방송을 청취하고 책임자의 지시가 있을 때까지 대기합니다.")
                        Text("안전카드를 지원자에게 보여주고, 자신의 상태를 알려주어 필요한 도움을 받습니다.")
                    } else {
                        Text("건물 밖으로 대피한 후, 주변의 넓은 공간으로 대피하며 차를 타지 않고 걸어갑니다.")
                        Text("이동 중에 주변에 낙하물이 없는지 확인하고 머리를 보호하며 주의하여 이동합니다.")
                        Text("건물 외벽에서 떨어진 안전한 곳으로 이동하여 흔들림이 멈추기를 기다립니다.")
                        Text("안전한 장소에서 라디오 등 안내방송을 청취하고 책임자의 지시가 있을 때까지 대기합니다.")
                        Text("안전카드를 지원자에게 보여주고, 자신의 상태를 알려주어 필요한 도움을 받습니다.")
                    }
                }
                .font(.title3)
                .fontWeight(.semibold)
            }
            .padding()
            
        }
    }
}

struct EarthquakeGuide_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            EarthquakeGuide()
                .preferredColorScheme(.dark)
        }
    }
}
