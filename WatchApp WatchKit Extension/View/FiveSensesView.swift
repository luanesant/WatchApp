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
            
            Progress5Senses(step: step)
                .padding(.top,40)
                .padding(.bottom,0)
                .fixedSize(horizontal: true, vertical: true)
            
            Text(tasksFiveSenses[step])
                .padding(.top, 30)//.aspectRatio(contentMode: .fill)
            
            if tasksFiveSenses.count - 1 > step {
                Button(Translations.Titles.readyTitle, action: {
                    self.step = self.step + 1
                })
                .buttonStyle(BorderedButtonStyle(tint: mainColorBlue.opacity(200)))
                .foregroundColor(Color.black)
            } else {
                NavigationLink(destination: FeedbackView()) {
                    Text("Final")
                }
                .buttonStyle(BorderedButtonStyle(tint: mainColorBlue.opacity(200)))
                .foregroundColor(Color.black)
            }
        }
        .navigationBarTitle(Translations.Titles.fiveSenses)
        .sheet(isPresented: $showModalView,content: {
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
    
    var body: some View {
        ZStack
        {
        ProgressView(value:(Double(step + 1) * 0.2)).progressViewStyle(CircularProgressViewStyle(tint: mainColorBlue))
        .scaleEffect(CGSize(width: 2.1, height: 2.1))
            
            VStack {
                Text("\(step + 1) / 5")
                    .font(.title3).aspectRatio(contentMode: .fit)
                Image(imageFiveSenses[step]).aspectRatio(contentMode: .fit)
                
            }
        
        
        }.fixedSize(horizontal: true, vertical: true)
    
    
    }
}

struct ModalView: View {
    @Binding var audioPlayer: AVAudioPlayer?
    var body: some View {
        VStack {
            Text(Translations.Titles.description)
        }
        .onDisappear {
            guard let sound = Bundle.main.url(forResource: "dolphin", withExtension: "mp3") else{ return }
            self.audioPlayer = try! AVAudioPlayer (contentsOf: sound)
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

