//
//  SirenView.swift
//  WhiteCane
//
//  Created by A_Mcflurry on 2023/08/26.
//

import SwiftUI
import AVFoundation

struct SirenView: View {
    @State private var isPress: Bool = false
    @State private var player: AVAudioPlayer?
    var body: some View {
        VStack {
            Text("긴급 사이렌")
                .font(.title)
                .fontWeight(.heavy)
                .padding(.top)
            
            Group {
                Text("사이렌 소리를 내서 주변 사람들에게\n도움을 요청합니다.")
                    .padding()
                Text("사이렌을 종료하려면 \n이중 탭하세요.")
            }
            .font(.title3)
            .multilineTextAlignment(.center)
            
            if !isPress {
                ButtonView(text: "사이렌 울리기", color: .redCustom, textColor: .white) {
                    isPress.toggle()
                    playSound(sound: .siren)
                }
                .frame(height: 167)
            } else {
                ButtonView(text: "사이렌 종료", color: .white, textColor: .redCustom) {
                    isPress.toggle()
                    playSound(sound: .siren)
                }
                .frame(height: 167)
            }
            
            Spacer()
        }
    }
    
    func playSound(sound: SoundEnum) {
        // 특정 조건(shouldPlay)이 충족되지 않으면 소리 재생하지 않음
        if isPress {
            guard let url = Bundle.main.url(forResource: sound.rawValue, withExtension: "mp3") else { return }
            
            do {
                player = try AVAudioPlayer(contentsOf: url)
                
                // 무한 반복 재생 설정
                player?.numberOfLoops = -1
                
                player?.play()
                
            } catch {
                print("소리 재생 중 오류 발생: \(error.localizedDescription)")
            }
        } else {
            do {
                player?.pause()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}

struct SirenView_Previews: PreviewProvider {
    static var previews: some View {
        SirenView()
            .preferredColorScheme(.dark)
    }
}
