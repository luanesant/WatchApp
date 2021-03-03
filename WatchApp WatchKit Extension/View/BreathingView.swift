//
//  BreathingView.swift
//  WatchApp WatchKit Extension
//
//  Created by Vinícius de Oliveira on 19/02/21.
//

import SwiftUI
import WatchKit
import UIKit
import SpriteKit
import AVFoundation

struct BreathingView: View {
    @State var timeToBreath: Int
    @State var audioPlayer: AVAudioPlayer?
 
    var body: some View {
            VStack {
                if timeToBreath > 0 {
                    Text(Translations.Titles.timeTitle).font(.title3).accessibility(label: Text(Translations.VoiceOver.contagemOver))
                    Text("\(timeToBreath)").font(.caption2)
                        .onAppear(){
                            timeToBreath *= 60
                            Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) {(timer) in
                                if timeToBreath > 0 {
                                    timeToBreath -= 1
                                }
                            }
                        }
                }
                else {
                    FeedbackView()
                }
                AnimationView()
                Text(Translations.Titles.inspire).font(.caption2)
                    .bold().accessibility(label: Text(Translations.VoiceOver.inspireOver))
                    
            }
            .navigationBarTitle(Translations.Titles.timeTitle).accessibility(label: Text(Translations.VoiceOver.timeBackOver))
            .onAppear {
                guard let sound = Bundle.main.url(forResource: "piano1", withExtension: "mp3") else{ return }
                self.audioPlayer = try! AVAudioPlayer (contentsOf: sound)
            self.audioPlayer?.numberOfLoops = -1
                self.audioPlayer?.play()
                self.audioPlayer?.volume = 0.1
            }
            .onDisappear {
                self.audioPlayer?.stop()
            }
    }
}

struct BreathingView_Previews: PreviewProvider {
    static var previews: some View {
        BreathingView(timeToBreath: 1)
    }
}

struct AnimationView: View {
    var scene: SKScene {
        let scene = AnimationScene()
        scene.size = CGSize(width: 200, height: 300)
        scene.scaleMode = .aspectFit
        scene.backgroundColor = .clear
        
        return scene
    }
    var body: some View {
        ZStack {
            SpriteView(scene: scene)
                .frame(width: 200, height: 100)
                .aspectRatio(contentMode: .fit)
        }
    }
}

class AnimationScene: SKScene {
    
    override func sceneDidLoad() {
        super.sceneDidLoad()
        
        var candleAssets: [SKTexture] = []
        
        for i in 1...16 {
            candleAssets.append(SKTexture(imageNamed: "velaacessa\(i)"))
        }
        for i in 17...30 {
            candleAssets.append(SKTexture(imageNamed: "velaapagada\(i)"))
        }
        
        
        
        let candle = SKSpriteNode(imageNamed: "velaacessa1")
        candle.scale(to: CGSize(width: 250, height: 350))
        self.addChild(candle)
        
        candle.run(.repeat(.animate(with: candleAssets, timePerFrame: 0.2), count: 7)) {
            candle.removeFromParent()
        }
        
        WKInterfaceDevice.current().play(.directionUp)
        
        
        self.anchorPoint = .init(x: 0.5, y: 0.5)
    }
}
