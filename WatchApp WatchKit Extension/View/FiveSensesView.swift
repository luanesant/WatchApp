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
    @State var showModalView: Bool
    @State var audioPlayer: AVAudioPlayer?
    
    let tasksFiveSenses = [
        Translations.FiveSenesTexts.visionText,
        Translations.FiveSenesTexts.senseText,
        Translations.FiveSenesTexts.hearText,
        Translations.FiveSenesTexts.touchText,
        Translations.FiveSenesTexts.eatText
    ]
    
    let taskOverSenses = [
        Translations.VoiceOver.visionOver,
        Translations.VoiceOver.sensesOver,
        Translations.VoiceOver.hearOver,
        Translations.VoiceOver.touchOver,
        Translations.VoiceOver.eatOver
    ]
    
    //let stepOverSenses = [
    //Translations.VoiceOver.visionImageOver,
    //    Translations.VoiceOver.sensesImageOver,
    //    Translations.VoiceOver.hearImageOver,
    //    Translations.VoiceOver.touchImageOver,
    //    Translations.VoiceOver.eatImageOver
    //]
    
    var body: some View {
        
        VStack {
            Spacer()
            Progress5Senses(step: step).padding(.top,10)
            Text(tasksFiveSenses[step])
                .padding(.top,10)
                .font(.body)
                .accessibility(label: Text(tasksFiveSenses[step]))
            
            if tasksFiveSenses.count - 1 > step {
                Button(Translations.Titles.readyTitle, action: {
                    self.step = self.step + 1
                })
                .font(.body)
                .buttonStyle(BorderedButtonStyle(tint: mainColorBlue.opacity(200)))
                .accessibility(label: Text(Translations.VoiceOver.readyOver))
                .accessibility(addTraits: .isButton)
                .foregroundColor(Color.black)
            } else {
                NavigationLink(destination: FeedbackView()) {
                    Text(Translations.Titles.readyTitle)
                }
                .accessibility(label: Text(Translations.VoiceOver.readyOver))
                .accessibility(addTraits: .isButton)
                .buttonStyle(BorderedButtonStyle(tint: mainColorBlue.opacity(200)))
                .foregroundColor(Color.black)
            }
        }
        .navigationBarTitle(Translations.Titles.fiveSenses)
        .sheet(isPresented: $showModalView, content: {
            ModalView(audioPlayer: self.$audioPlayer, showModal: $showModalView)
                .navigationBarHidden(true)
                .accessibility(label: Text(Translations.VoiceOver.modalOver))
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
                .frame(width: 200, height: 100, alignment: .center)
                .animation(.linear)
            
            VStack {
                Text("\(step + 1) / 5")
                    .font(.title3)
                    .aspectRatio(contentMode: .fit)
                    .font(.caption2)
                Image(imageFiveSenses[step])
                    .aspectRatio(contentMode: .fit)
                    .accessibility(label: Text(Translations.VoiceOver.imageOver))
            }
        }
        .frame(width: 200, height: 90, alignment: .topLeading)
        
    }
    
}

struct ModalView: View {
    @Binding var audioPlayer: AVAudioPlayer?
    @Binding var showModal: Bool
    
    var body: some View {
        
        ScrollView(.vertical){
            VStack {
                Text(Translations.Titles.titleDescription).font(.body).bold()
                    .padding(.bottom,10).accessibility(label: Text(Translations.Titles.titleDescription))
                    
                Text(Translations.Titles.description)
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 10).accessibility(label: Text(Translations.VoiceOver.modalOver))
                Button(Translations.Titles.buttonDescription, action: {
                    UserDefaults.standard.set(true, forKey: "hideModal")
                    self.showModal = !UserDefaults.standard.bool(forKey: "hideModal")
                }).accessibility(label: Text(Translations.Titles.buttonDescription)).accessibility(addTraits: .isButton)
                .font(.body)
                .foregroundColor(Color.red)
                Button(Translations.Titles.buttonCancel, action: {
                    self.showModal = false
                }).accessibility(label: Text(Translations.VoiceOver.buttonCancelOver)).accessibility(addTraits: .isButton)
                .font(.body)
            }
        }
        .onDisappear {
            if let sound = Bundle.main.url(forResource: "piano2", withExtension: "mp3") {
                self.audioPlayer = try! AVAudioPlayer (contentsOf: sound)
                self.audioPlayer?.numberOfLoops = -1
                self.audioPlayer?.play()
                self.audioPlayer?.volume = 0.1
            }
        }
    }
}

struct FiveSensesView_Previews: PreviewProvider {
    static var previews: some View {
        FiveSensesView(step: 0, showModalView: false)
    }
}


