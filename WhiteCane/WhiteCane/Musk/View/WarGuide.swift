//
//  WarGuide.swift
//  WhiteCane
//
//  Created by A_Mcflurry on 2023/08/26.
//

import SwiftUI

struct WarGuide: View {
    @State private var isPress: Bool = false
    var body: some View {
        VStack {
            Text("전쟁 발발 시 행동 요령")
                .font(.title)
                .fontWeight(.semibold)
                .padding()
            
            HStack(spacing: 0) {
                Button {
                    isPress = false
                } label: {
                    Rectangle()
                        .stroke(Color.yellowCustom)
                        .frame(width: 170, height: 60)
                        .overlay {
                            Text("대피 안내")
                                .foregroundColor(.white)
                                .font(.title2)
                                .fontWeight(.semibold)
                        }
                }
                
                Button {
                    isPress = true
                } label: {
                    Rectangle()
                        .stroke(Color.yellowCustom)
                        .frame(width: 170, height: 60)
                        .overlay {
                            Text("주의사항")
                                .foregroundColor(.white)
                                .font(.title2)
                                .fontWeight(.semibold)
                        }
                }
            }
            .padding(.bottom)
            if(!isPress){
                Text("전쟁 발발 시 대피 안내")
                    .font(.title3)
                    .fontWeight(.semibold)
            }
            else{
                Text("전쟁 발발 시 주의사항")
                    .font(.title3)
                    .fontWeight(.semibold)
                
            }
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    if !isPress {
                        Text("집을 중심으로 정부의 방송(티비,라디오)을 청취하며 안내에 따라 행동합니다.")
                        Text("대피령이 발령되면 신속하고 질서있게 대피합니다.")
                        Text("대피한 뒤에도 계속 정부의 방송을 듣고 안내에 따라 행동합니다.")
                        Text("아파트나 고층건물에서는 엘리베이터를 사용하지 않고 비상계단을 이용합니다.")
                        Text("대피소로 이동이 어려울 경우, 몸을 엎드려 도랑이나 움푹 파인곳으로 숨습니다.")
                    } else {
                        Text("화재 발생 시 유독가스에 질식되지 않도록 입과 코를 가리고 최대한 낮은 자세로 이동합니다.")
                        Text("벽돌 잔해 등 파편과 대형 가구 및 가전제품이 쓰러지는 것에 주의합니다.")
                        Text("건물 잔해에 갇혔을 경우, 무리하게 빠져나오려 하지 말고 편안한 자세를 유지합니다.")
                        Text("구조를 기다릴 때 휴대폰 발신음이나 파이프, 잔해 등으로 주기적인 구조 신호를 보냅니다.")
                        Text("누출 가스로 인한 폭발 위험이 있으므로 성냥이나 라이터를 사용하지 않습니다.")
                    }
                }
                .font(.title3)
                .fontWeight(.semibold)
            }
            .padding()
            
        }
    }
}

struct WarGuide_Previews: PreviewProvider {
    static var previews: some View {
        WarGuide()
            .preferredColorScheme(.dark)
    }
}
