//
//  OnboardingView.swift
//  WhiteCane
//
//  Created by A_Mcflurry on 2023/08/25.
//

import SwiftUI

struct OnboardingView: View {
    var body: some View {
        VStack(spacing: 20) {
            Group {
                Text("환영해요!")
                    .fontWeight(.heavy)
                    .font(.title)
                Text("안전지팡이는 재난 상황에서\n시각 지원이 필요한 분들을 위해 만들어졌어요.")
                Text("지진, 전시 상황에서 가까운 대피소로\n빠르고 안전하게 안내해드릴게요!")
                Text("안전지팡이를 사용하면 다음과 같은 기능을\n수행할 수 있어요.")
            }
            .multilineTextAlignment(.center)
            VStack(alignment: .leading) {
                
                HStack {
                    ZStack {
                        Image(systemName: "location.circle.fill")
                            .resizable()
                            .frame(width: 24, height: 24)
                            .accessibility(hidden: true)
                        Circle()
                            .stroke(Color.yellowCustom)
                            .frame(width: 50, height: 50)
                    }
                    VStack(alignment: .leading) {
                        Text("대피소 안내")
                            .fontWeight(.semibold)
                            .accessibility(label: Text("대피소 안내"))
                    }
                    .padding(.leading, 10)
                }
                .accessibilityElement(children: .combine)
                .accessibility(label: Text("대피소 안내"))
                
                HStack {
                    ZStack {
                        Image(systemName: "lanyardcard.fill")
                            .resizable()
                            .frame(width: 19, height: 24)
                            .accessibility(hidden: true)
                        Circle()
                            .stroke(Color.yellowCustom)
                            .frame(width: 50, height: 50)
                    }
                    VStack(alignment: .leading) {
                        Text("건강정보 카드")
                            .fontWeight(.semibold)
                            .accessibility(label: Text("건강정보 카드"))
                        Text("긴급 상황시 제시해요.")
                            .accessibility(label: Text("긴급 상황시 제시해요."))
                    }
                    .padding(.leading, 10)
                }
                
                HStack {
                    ZStack {
                        Image(systemName: "person.fill.questionmark")
                            .resizable()
                            .frame(width: 24, height: 20)
                            .accessibility(hidden: true)
                        Circle()
                            .stroke(Color.yellowCustom)
                            .frame(width: 50, height: 50)
                    }
                    VStack(alignment: .leading) {
                        Text("재난 상황별 행동 요령")
                            .fontWeight(.semibold)
                            .accessibility(label: Text("재난 상황별 행동 요령"))
                    }
                    .padding(.leading, 10)
                }

                
                HStack {
                    ZStack {
                        Image(systemName: "envelope.fill")
                            .resizable()
                            .frame(width: 24, height: 18)
                            .accessibility(hidden: true)
                        Circle()
                            .stroke(Color.yellowCustom)
                            .frame(width: 50, height: 50)
                    }
                    VStack(alignment: .leading) {
                        Text("재난 문자 확인")
                            .fontWeight(.semibold)
                            .accessibility(label: Text("재난 문자 확인"))
                        Text("최근 일주일간의 문자를 확인해요.")
                            .accessibility(label: Text("최근 일주일간의 문자를 확인해요."))
                    }
                    .padding(.leading, 10)
                }
                
                HStack {
                    ZStack {
                        Image(systemName: "light.beacon.max.fill")
                            .resizable()
                            .frame(width: 28, height: 24)
                            .accessibility(hidden: true)
                        Circle()
                            .stroke(Color.yellowCustom)
                            .frame(width: 50, height: 50)
                    }
                    VStack(alignment: .leading) {
                        Text("긴급 사이렌")
                            .fontWeight(.semibold)
                            .accessibility(label: Text("긴급 사이렌"))
                        Text("주변 도움이 필요할 때 사용해요.")
                            .accessibility(label: Text("주변 도움이 필요할 때 사용해요."))
                    }
                    .padding(.leading, 10)
                }
            }
            .padding(.bottom)
            NavigationLinkView(text: "확인했어요.", destination: MainView())
                .frame(height: 100)

            
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            OnboardingView()
                .preferredColorScheme(.dark)
        }
    }
}
