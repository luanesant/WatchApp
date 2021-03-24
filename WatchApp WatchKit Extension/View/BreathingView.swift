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
    @State var breathHasFinished = false
    
    var session = WKExtendedRuntimeSession()
    
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
                        .accessibility(label: exhaleIsShowing ? Text(Translations.Titles.expire) : Text(Translations.Titles.inspire))
                }
            }
            .navigationBarTitle(Translations.Titles.timeTitle)
            .onAppear {
                
                guard let sound = Bundle.main.url(forResource: "piano1", withExtension: "mp3") else{ return }
                self.audioPlayer = try! AVAudioPlayer (contentsOf: sound)
            self.audioPlayer?.numberOfLoops = -1
                self.audioPlayer?.play()
                self.audioPlayer?.volume = 1.0
                
                controlTimeLabel = timeToBreath - 6
                
                Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) {(timer) in
                    session.start()
                    
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
                    } else if timeToBreath == 0 {
                        self.audioPlayer?.stop()
                        if breathHasFinished == false {
                            WKInterfaceDevice.current().play(.stop)
                            breathHasFinished = true
                        }
                        session.invalidate()
                    }
                }
            }
            .onDisappear() {
//                self.audioPlayer?.stop()
                timeToBreath = 0
                breathHasFinished = true
                session.invalidate()
            }
    }
}

struct BreathingView_Previews: PreviewProvider {
    static var previews: some View {
        BreathingView(timeToBreath: 60)
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
                .frame(width: 200, height: 130)
                .aspectRatio(contentMode: .fit)
        }
    }
}

class AnimationScene: SKScene {
    override init() {
        super.init(size: CGSize(width: 200, height: 300))
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func sceneDidLoad() {
        super.sceneDidLoad()
        
        let flameAtlas = SKTextureAtlas(named: "flameAtlas")
        var flameAssets: [SKTexture] = []
        
        let candleAssets = [
            SKTexture(imageNamed: "velaPequena"),
            SKTexture(imageNamed: "velaPequena2")
        ]
        
        //inhale assets
        for i in 3...16 {
            flameAssets.append(flameAtlas.textureNamed("chama\(i)"))
        }
        for i in 11...16 {
            flameAssets.append(flameAtlas.textureNamed("chama\(i)"))
        }
        for i in 11...16 {
            flameAssets.append(flameAtlas.textureNamed("chama\(i)"))
        }
        for i in 11...16 {
            flameAssets.append(flameAtlas.textureNamed("chama\(i)"))
        }
        for i in 11...16 {
            flameAssets.append(flameAtlas.textureNamed("chama\(i)"))
        }
        //exhale assets
        for i in 17...21 {
            flameAssets.append(flameAtlas.textureNamed("chama\(i)"))
        }
        for i in 17...29 {
            flameAssets.append(flameAtlas.textureNamed("chama\(i)"))
        }
        flameAssets.append(flameAtlas.textureNamed("chama0"))
        
        let flame = SKSpriteNode(texture: flameAssets[0])
        flame.size = CGSize(width: 150, height: 150)
        
        let candle = SKSpriteNode(texture: candleAssets[0])
        candle.size = CGSize(width: 121.5, height: 125.5)
        
        self.addChild(candle)
        
        candle.addChild(flame)
        
        self.anchorPoint = .init(x: 0.5, y: 0.5)
        candle.anchorPoint = .init(x: 0.5, y: 1)
        flame.anchorPoint = .init(x: 0.46, y: 0.2)
        
        flame.run(.repeatForever(.animate(with: flameAssets, timePerFrame: 0.157895, resize: false, restore: true)), withKey: "candleAnimationRunnning")
        candle.run(.repeatForever(.animate(with: candleAssets, timePerFrame: 1)))
    }
}
