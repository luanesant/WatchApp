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

struct BreathingView: View {
    @State var timeToBreath: Int
 
    var body: some View {
            VStack {
                if timeToBreath > 0 {
                    Text(Translations.Titles.timeTitle)
                    Text("\(timeToBreath)")
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
                AnimationView(timeToBreath: timeToBreath)
                Text(Translations.Titles.inspire)
                    .font(.caption2)
                    .bold()
            }
            .navigationBarTitle(Translations.Titles.timeTitle)
    }
}

struct BreathingView_Previews: PreviewProvider {
    static var previews: some View {
        BreathingView(timeToBreath: 1)
    }
}

struct AnimationView: View {
    @State var timeToBreath: Int
    
    var scene: SKScene {
        let scene = AnimationScene(timeToBreath: timeToBreath)
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
        
        self.anchorPoint = .init(x: 0.5, y: 0.5)
        
        var candleAssets: [SKTexture] = []
        
        for i in 1...16 {
            candleAssets.append(SKTexture(imageNamed: "velaacessa\(i)"))
        }
        for i in 17...30 {
            candleAssets.append(SKTexture(imageNamed: "velaapagada\(i)"))
        }
        
        let candle = SKSpriteNode(imageNamed: "velaacessa1")
        candle.scale(to: CGSize(width: 300, height: 350))
        self.addChild(candle)
        
        candle.run(.repeat(.animate(with: candleAssets, timePerFrame: 0.2), count: 7*timeToBreath)) {
            candle.removeFromParent()
        }

        WKInterfaceDevice.current().play(.directionUp)
    }
    
    func startAnimation() {
        
    }
}
