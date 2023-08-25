//
//  MainView.swift
//  WhiteCane
//
//  Created by A_Mcflurry on 2023/08/25.
//

import SwiftUI
import AVFoundation

struct MainView: View {
    
    
    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            Text("손에 잡히는 안전,  \n안전 지팡이")
                .multilineTextAlignment(.center)
                .font(.title)
                .fontWeight(.semibold)
                .padding(.bottom)
            
            NavigationLinkView(text: "대피소 안내", destination: ShelterRoute())
                .frame(height: 100)
            
            NavigationLinkView(text: "건강정보 카드", destination: HealthInfoView())
                .frame(height: 100)
            
            NavigationLinkView(text: "재난 상황별 행동 요령", destination: GuidelinesView())
                .frame(height: 100)
            
            NavigationLinkView(text: "재난 문자 확인하기", destination: DisasterCheckView())
                .frame(height: 100)
            
            Spacer()
            
            sirenButton
            
        }
        .navigationBarBackButtonHidden()
    }
    
    var sirenButton: some View {
        Button {
//            playSound(sound: .siren)
        } label: {
            ZStack {
                Rectangle()
                    .cornerRadius(30)
                    .foregroundColor(.redCustom)
                
                HStack {
                    VStack {
                        Text("긴급 사이렌")
                            .fontWeight(.semibold)
                            .font(.title2)
                            .foregroundColor(.white)
                        
                        Text("Emergency Sound")
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                    }
                    .padding(.leading)
                    Spacer()
                    Image(systemName: "light.beacon.max.fill")
                        .resizable()
                        .frame(width: 48,height: 43)
                        .foregroundColor(.white)
                        .padding(.horizontal)
                        
                }
                    
            }
            .padding(.horizontal, 24)
            .frame(height: 70)
        }
    }
    

}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            MainView()
                .preferredColorScheme(.dark)
        }
    }
}
