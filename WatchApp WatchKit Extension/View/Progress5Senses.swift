//
//  Progress5Senses.swift
//  WatchApp WatchKit Extension
//
//  Created by Radija Praia on 05/03/21.
//

import SwiftUI

struct Progress5Senses: View {
    var step: Int
    
    let imageFiveSenses = [
        "senseEye",
        "senseHand",
        "senseNote",
        "senseInhale",
        "senseApple"
    ]
    
    private let gradient = AngularGradient(
        gradient: Gradient(colors: [colorLinear3, mainColorBlue, mainColorBlue, colorLinear3]),
        center: .center,
        startAngle: .degrees(270),
        endAngle: .degrees(0))
    
    
    var body: some View {
        ZStack{
            Circle()
                .stroke(bgProgress, lineWidth: 10)
                .rotationEffect(.degrees(-90))
                .scaleEffect(CGSize(width: 0.8, height: 0.8))
                .frame(width: 200, height: 100, alignment: .center)
            Circle()
                .trim(from: 0.0, to: (CGFloat(step + 1) * 0.2))
                .stroke(gradient, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
                .rotationEffect(.degrees(-90))
                .scaleEffect(CGSize(width: 0.8, height: 0.8))
                .frame(width: 200, height: 100, alignment: .center)
                .animation(.linear)
            
            VStack {
                Text("\(step + 1) / 5")
                    .font(.system(.caption2, design: .rounded))
                    .fontWeight(.semibold)
                    .aspectRatio(contentMode: .fit)
                Image(imageFiveSenses[step])
                    .aspectRatio(contentMode: .fit)
                    .accessibility(label: Text(Translations.VoiceOver.imageOver))
            }
            RoundedRectangle(cornerRadius: 30).fill(Color.red).frame(width: 10, height: 100).padding(.leading, 150.0)//.hidden()

        }
        .frame(width: 200, height: 90, alignment: .topLeading)
        
    }
    
}

struct Progress5Senses_Previews: PreviewProvider {
    static var previews: some View {
        Progress5Senses(step: 1)
    }
}
