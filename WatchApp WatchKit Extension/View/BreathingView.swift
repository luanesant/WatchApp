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
//                if timeToBreath > 0 {
//                    Text(Translations.Titles.timeTitle).font(.title3)
//                    Text("\(timeToBreath)").font(.caption2)
//                        .onAppear(){
//                            Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) {(timer) in
//                                if timeToBreath > 0 {
//                                    timeToBreath -= 1
//                                }
//                            }
//                        }
//                }
//                else {
//                    FeedbackView()
//                }
                AnimationView(isFinished: false, timeToBreath: timeToBreath)
                Text(Translations.Titles.expire)
                    .font(.caption2)
                    .bold()
            }
            .navigationBarTitle(Translations.Titles.timeTitle).accessibility(label: Text(Translations.VoiceOver.timeOver))
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
    
    @State var isFinished: Bool
    var timeToBreath: Int
    
    var scene: SKScene {
        let scene = AnimationScene(timeToBreath: 1)
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
    
    var timeToBreath: Int

    init(timeToBreath: Int) {
        self.timeToBreath = timeToBreath
        super.init(size: CGSize(width: 200, height: 300))
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func sceneDidLoad() {
        super.sceneDidLoad()
        
        var candleAssets: [SKTexture] = []
        
        for i in 3...16 {
            candleAssets.append(SKTexture(imageNamed: "velaacessa\(i)"))
        }
        for i in 11...16 {
            candleAssets.append(SKTexture(imageNamed: "velaacessa\(i)"))
        }
        for i in 11...16 {
            candleAssets.append(SKTexture(imageNamed: "velaacessa\(i)"))
        }
        for i in 17...24 {
            candleAssets.append(SKTexture(imageNamed: "velaapagada\(i)"))
        }
        for i in 17...30 {
            candleAssets.append(SKTexture(imageNamed: "velaapagada\(i)"))
        }
        
        let candle = SKSpriteNode(imageNamed: "velaacessa1")
        candle.scale(to: CGSize(width: 250, height: 350))
        self.addChild(candle)
        
        self.anchorPoint = .init(x: 0.5, y: 0.5)
        
        WKInterfaceDevice.current().play(.directionUp)
        
        candle.run(.repeat(.animate(with: candleAssets, timePerFrame: 0.16), count: 7)) {
            candle.removeFromParent()
        }
    }
}
