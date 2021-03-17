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
    @State var exhaleIsShowing: Bool = true
    @State var controlTimeLabel = 0
    @State var controlTimeLabelToggle = false
    
    var body: some View {
            VStack {
                if timeToBreath == 0 {
                    FeedbackView()
                }
                else {
                    AnimationView()
                    
                    Text(exhaleIsShowing ? Translations.Titles.expire : Translations.Titles.inspire)
                        .font(.system(.body, design: .rounded))
                        .bold()
                }
            }
            .navigationBarTitle(Translations.Titles.timeTitle).accessibility(label: Text(Translations.VoiceOver.timeBackOver))
            .onAppear {
                guard let sound = Bundle.main.url(forResource: "piano1", withExtension: "mp3") else{ return }
                self.audioPlayer = try! AVAudioPlayer (contentsOf: sound)
            self.audioPlayer?.numberOfLoops = -1
                self.audioPlayer?.play()
                self.audioPlayer?.volume = 1.0
                
                controlTimeLabel = timeToBreath - 6
                
                Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) {(timer) in
                    if timeToBreath > 0 {
                        timeToBreath -= 1
                        
                        if timeToBreath > controlTimeLabel {
                            exhaleIsShowing = controlTimeLabelToggle ? false : true
                        } else {
                            controlTimeLabelToggle.toggle()
                            exhaleIsShowing = false
                            controlTimeLabel -= controlTimeLabelToggle ? 3 : 6
                            WKInterfaceDevice.current().play(controlTimeLabelToggle ? .directionUp : .directionDown)
                        }
                    }
                }
            }
            .onDisappear {
                self.audioPlayer?.stop()
                timeToBreath = 0
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
        scene.scaleMode = .aspectFit
        scene.backgroundColor = .clear
        
        return scene
    }
    
    
    var body: some View {
        ZStack {
            SpriteView(scene: scene)
                .frame(width: 200, height: 140)
                .aspectRatio(contentMode: .fit)
        }
    }
}

class AnimationScene: SKScene {
    
//    var timeToBreath: Int

    override init() {
//        self.timeToBreath = timeToBreath
        super.init(size: CGSize(width: 200, height: 300))
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func sceneDidLoad() {
        super.sceneDidLoad()
        
        let candleAtlas = SKTextureAtlas(named: "candleAtlas")
        var candleAssets: [SKTexture] = []
        
        //inhale assets
        for i in 3...16 {
            candleAssets.append(candleAtlas.textureNamed("velaacessa\(i)"))
        }
        for i in 11...16 {
            candleAssets.append(candleAtlas.textureNamed("velaacessa\(i)"))
        }
        for i in 11...16 {
            candleAssets.append(candleAtlas.textureNamed("velaacessa\(i)"))
        }
        for i in 11...16 {
            candleAssets.append(candleAtlas.textureNamed("velaacessa\(i)"))
        }
        for i in 11...16 {
            candleAssets.append(candleAtlas.textureNamed("velaacessa\(i)"))
        }
        //exhale assets
        for i in 17...21 {
            candleAssets.append(candleAtlas.textureNamed("velaapagada\(i)"))
        }
        for i in 17...30 {
            candleAssets.append(candleAtlas.textureNamed("velaapagada\(i)"))
        }
        
        let candle = SKSpriteNode(texture: candleAssets[0])
        candle.scale(to: CGSize(width: 200, height: 280))
        self.addChild(candle)
        
        self.anchorPoint = .init(x: 0.5, y: 0.5)
        
        candle.run(.repeatForever(.animate(with: candleAssets, timePerFrame: 0.157895, resize: false, restore: true)), withKey: "candleAnimationRunnning")
    }
}
class Assets {
    static let sharedInstance = Assets()
    let sprites = SKTextureAtlas(named: "Sprites")

    func preloadAssets() {
        sprites.preload {
            print("Sprites preloaded")
        }
    }
}
