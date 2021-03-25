//
//  BreathingView.swift
//  WatchApp WatchKit Extension
//
//  Created by Vinícius de Oliveira on 19/02/21.
//

import SwiftUI
import WatchKit
import SpriteKit
import AVFoundation

struct BreathingView: View {
    @State var timeToBreath: Int
    @State var audioPlayer: AVAudioPlayer?
    @State var exhaleIsShowing: Bool = true
    @State var controlTimeLabel = 0
    @State var controlTimeLabelToggle = false
    @State var breathHasFinished = false
    
    @State var minutes: Double = 1
    
    var session = WKExtendedRuntimeSession()
    
    var body: some View {
            VStack {
                if timeToBreath == 0 {
                    
                    FeedbackView()
                }
                else {
                    AnimationView(minutes: minutes)
                    
                    Text(exhaleIsShowing ? Translations.Titles.expire : Translations.Titles.inspire)
                        .font(.system(.body, design: .rounded))
                        .bold()
                        .accessibility(label: exhaleIsShowing ? Text(Translations.Titles.expire) : Text(Translations.Titles.inspire))
                }
            }
            .navigationBarTitle(Translations.Titles.timeTitle)
            .onAppear {
                minutes = Double(timeToBreath/60)
                
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
    var minutes: Double
    
    var scene: SKScene {
        let scene = AnimationScene(minutes: minutes)
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
    
    var minutes: Double
    
    let candle = SKSpriteNode(texture: SKTexture(imageNamed: "velaPequena"))
    let flame = SKSpriteNode(texture: SKTexture(imageNamed: "chama3"))
    
    init(minutes: Double) {
        self.minutes = minutes
        super.init(size: CGSize(width: 200, height: 300))
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func sceneDidLoad() {
        super.sceneDidLoad()
        
        let flameAtlas = SKTextureAtlas(named: "flameAtlas")
        var flameAssets: [SKTexture] = []
        
        var candleAssets: [SKTexture] = []
        
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
        
        //Candle assets
        for i in 0...140 {
            if i < 10 {
                candleAssets.append(SKTexture(imageNamed: "Velabase 2_00\(i)"))
            } else if i < 100 {
                candleAssets.append(SKTexture(imageNamed: "Velabase 2_0\(i)"))
            } else if i >= 100 {
                candleAssets.append(SKTexture(imageNamed: "Velabase 2_\(i)"))
            }
        }
        
        candle.size = CGSize(width: 137.5, height: 200)
        
        flame.size = CGSize(width: 125.5, height: 125.5)
        flame.position = CGPoint(x: 4, y: candle.size.height + 30)
        
        self.anchorPoint = .init(x: 0.5, y: 0)
        candle.anchorPoint = .init(x: 0.5, y: 0)
        
        self.addChild(candle)
        candle.addChild(flame)
        
        flame.run(.repeatForever(.animate(with: flameAssets, timePerFrame: 0.157895, resize: false, restore: true)), withKey: "candleAnimationRunnning")
        candle.run(.repeatForever(.animate(with: candleAssets, timePerFrame: 0.42553191 * minutes)))
    }
    
    override func update(_ currentTime: TimeInterval) {
        flame.position.y -= CGFloat(0.023 / minutes)
    }
}
