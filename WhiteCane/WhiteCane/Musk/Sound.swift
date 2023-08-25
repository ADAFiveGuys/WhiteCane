//
//  Sound.swift
//  WhiteCane
//
//  Created by A_Mcflurry on 2023/08/25.
//

import SwiftUI
import AVFoundation

enum SoundEnum: String {
    case rooster = "rooster"
    case siren = "siren"
}

struct Sound: View {
    @State private var player: AVAudioPlayer?
    var body: some View {
        Button("Label") {
            playSound(sound: .rooster)
        }
    }
    
    func playSound(sound : SoundEnum) {
        guard let url = Bundle.main.url(forResource: sound.rawValue, withExtension: "mp3") else { return }
            
            do {
                player = try AVAudioPlayer(contentsOf: url)
                player?.play()
            } catch {
                print("소리 재생 중 오류 발생: \(error.localizedDescription)")
            }
        }
}

struct Sound_Previews: PreviewProvider {
    static var previews: some View {
        Sound()
    }
}

