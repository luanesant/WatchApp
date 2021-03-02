//
//  FiveSensesView.swift
//  WatchApp
//
//  Created by Radija Praia on 22/02/21.
//

import SwiftUI
import AVFoundation


struct FiveSensesView: View {

    @State var step: Int = 0
    @State var showModalView = true
    @State var audioPlayer: AVAudioPlayer?
    
    
    let tasksFiveSenses = [
        Translations.FiveSenesTexts.visionText,
        Translations.FiveSenesTexts.senseText,
        Translations.FiveSenesTexts.hearText,
        Translations.FiveSenesTexts.touchText,
        Translations.FiveSenesTexts.eatText
    ]
    
    var body: some View {
        
        VStack {
            Spacer()
            Progress5Senses(step: step).padding(.top,10)
            Text(tasksFiveSenses[step]).padding(.top,10)
     
            if tasksFiveSenses.count - 1 > step {
                Button(Translations.Titles.readyTitle, action: {
                    self.step = self.step + 1
                })
                .buttonStyle(BorderedButtonStyle(tint: mainColorBlue.opacity(200)))
                .foregroundColor(Color.black)
            } else {
                NavigationLink(destination: FeedbackView()) {
                    Text(Translations.Titles.readyTitle) 
                }
                .buttonStyle(BorderedButtonStyle(tint: mainColorBlue.opacity(200)))
                .foregroundColor(Color.black)
            }
        }
        .navigationBarTitle(Translations.Titles.fiveSenses)
        .sheet(isPresented: $showModalView, content: {
            ModalView(audioPlayer: self.$audioPlayer)
        })
        .onDisappear {
            self.audioPlayer?.stop()
        }
        
    }
    
}

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
                .frame(width: 200, height: 100, alignment: .center).animation(.linear)
            
            VStack {
                Text("\(step + 1) / 5")
                    .font(.title3).aspectRatio(contentMode: .fit)
                Image(imageFiveSenses[step]).aspectRatio(contentMode: .fit)
                
            }
        }
        .frame(width: 200, height: 90, alignment: .topLeading)

    }
    
}

struct ModalView: View {
    @Binding var audioPlayer: AVAudioPlayer?

    var body: some View {
        
        VStack {
            Text(Translations.Titles.description)
        }
        .onDisappear {
            guard let sound = Bundle.main.url(forResource: "piano2", withExtension: "mp3") else{ return }
            self.audioPlayer = try! AVAudioPlayer (contentsOf: sound)
            self.audioPlayer?.numberOfLoops = -1
            self.audioPlayer?.play()
            self.audioPlayer?.volume = 0.1
        }
    }
}

struct FiveSensesView_Previews: PreviewProvider {
    static var previews: some View {
        FiveSensesView(step: 0)
    }
}

