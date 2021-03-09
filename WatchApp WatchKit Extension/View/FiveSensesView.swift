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
//    @State var rotate = 0.0
//    var gire = ""
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
    
        
        VStack {
            Spacer()
            Progress5Senses(step: step).padding(.top,10)
            Text(tasksFiveSenses[step])
                .fontWeight(.semibold)
                .multilineTextAlignment(.center)
                .padding(.top,10)
//                .frame(width: 180.0)
                .offset(y: -8)
                .font(.system(.caption2, design: .rounded))

                .accessibility(label: Text(tasksFiveSenses[step]))
          
//            gire = Text("\(rotate)").focusable(true).digitalCrownRotation( $rotate, from: 0.0, through: 1.0, by: 0.1, isContinuous: false, isHapticFeedbackEnabled: true) as! String
            
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
                .offset(y: -8)
                .accessibility(label: Text(Translations.VoiceOver.readyOver))
                .accessibility(addTraits: .isButton)
                .buttonStyle(BorderedButtonStyle(tint: mainColorBlue.opacity(200)))
                .foregroundColor(Color.black)
            }
        }
        .navigationBarTitle(Translations.Titles.fiveSenses).font(.system(.body, design: .rounded))
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


struct FiveSensesView_Previews_1: PreviewProvider {
    static var previews: some View {
        FiveSensesView(step: 1)
    }
}

struct FiveSensesView_Previews_2: PreviewProvider {
    static var previews: some View {
        FiveSensesView(step: 2)
    }
}

struct FiveSensesView_Previews_3: PreviewProvider {
    static var previews: some View {
        FiveSensesView(step: 3)
    }
}

struct FiveSensesView_Previews_4: PreviewProvider {
    static var previews: some View {
        FiveSensesView(step: 4)
    }
}
