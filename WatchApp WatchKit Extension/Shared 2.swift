//
//  Shared.swift
//  WatchApp WatchKit Extension
//
//  Created by Radija Praia on 25/02/21.
//

import SwiftUI
import Foundation
import AVFoundation

public let bgButton = Color(red: 0.16, green: 0.16, blue: 0.16)
public let mainColorBlue = Color(red: 0.67, green: 0.91, blue: 0.93)
public let circleColorBlue = Color(red: 0.60, green: 0.95, blue: 0.96)

public let colorLinear1 = Color(red: 0.50, green: 0.78, blue: 0.97)
public let colorLinear2 = Color(red: 0.49, green: 0.51, blue: 0.95)
public let colorLinear3 = Color(red: 0.36, green: 0.39, blue: 0.78)
public let bgProgress = Color(red: 0.31, green: 0.30, blue: 0.30)

class BgMusic {
    var audioPlayer: AVAudioPlayer

    init(_ name: String) {
        let sound = Bundle.main.url(forResource: "piano2", withExtension: "mp3")
        self.audioPlayer = try! AVAudioPlayer(contentsOf: sound!)
        self.audioPlayer.numberOfLoops = -1
        self.audioPlayer.volume = 0.1
    }
    
    func play() {
        self.audioPlayer.play()
    }
    
    func stop() {
        self.audioPlayer.stop()
    }
}
