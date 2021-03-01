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
                AnimationView()
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
        
        let candleAssets = [
            SKTexture(imageNamed: "candle"),
            SKTexture(imageNamed: "candle2")
        ]
        
        let candle = SKSpriteNode(imageNamed: "candle")
        candle.scale(to: CGSize(width: 46*2.5, height: 112*2.5))
        self.addChild(candle)
        
        candle.run(.repeat(.animate(with: candleAssets, timePerFrame: 4), count: 7))
        
        self.anchorPoint = .init(x: 0.5, y: 0.5)
    }
}
