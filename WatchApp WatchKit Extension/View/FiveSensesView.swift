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
    @State var audioPlayer: BgMusic?
//    @State var audioPlayer: AVAudioPlayer?
    @ObservedObject var modal: ModalViewState = .init()
    
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

    
    var body: some View {
        HStack{
            RoundedRectangle(cornerRadius: 30).fill(Color.red).frame(width: 10, height: 100).padding(.leading, 40.0)
        VStack {
            Spacer()
            Progress5Senses(step: step).padding(.top,10)
            Text(tasksFiveSenses[step])
                .padding(.top,10)
                .frame(width: 200.0)
                .offset(y: -8)
                .font(.system(.body, design: .rounded))
                .accessibility(label: Text(tasksFiveSenses[step]))
            
            if tasksFiveSenses.count - 1 > step {
                Button(Translations.Titles.readyTitle, action: {
                    self.step = self.step + 1
                })
                .font(.system(.body, design: .rounded))
                .buttonStyle(BorderedButtonStyle(tint: mainColorBlue.opacity(200)))
                .offset(y: -8)
                .accessibility(label: Text(Translations.VoiceOver.readyOver))
                .accessibility(addTraits: .isButton)
                .foregroundColor(Color.black)
            } else {
                NavigationLink(destination: FeedbackView()) {
                    Text(Translations.Titles.readyTitle)
                        .font(.system(.body, design: .rounded))
                }
                .accessibility(label: Text(Translations.VoiceOver.readyOver))
                .accessibility(addTraits: .isButton)
                .buttonStyle(BorderedButtonStyle(tint: mainColorBlue.opacity(200)))
                .foregroundColor(Color.black)
            }
            }
        }
        .navigationBarTitle(Translations.Titles.fiveSenses)
        .sheet(isPresented: $modal.isShowModal, content: {
            ModalView(audioPlayer: self.$audioPlayer, showModal: $modal.isShowModal)
                .navigationBarHidden(true)
                .accessibility(label: Text(Translations.VoiceOver.modalOver))
        })
        .onAppear {
            if !modal.isShowModal {
                self.audioPlayer = BgMusic("piano2")
                self.audioPlayer?.play()
            }
        }
        .onDisappear {
            if let player = self.audioPlayer {
                player.stop()
            
            }
        }
        
    }
    
}

class ModalViewState: ObservableObject {
    @Published var isShowModal = !UserDefaults.standard.bool(forKey: "hideModal")
}

struct FiveSensesView_Previews: PreviewProvider {
    static var previews: some View {
        FiveSensesView(step: 0)
    }
}


