//
//  ModalView.swift
//  WatchApp WatchKit Extension
//
//  Created by Radija Praia on 05/03/21.
//

import SwiftUI
import AVFoundation

struct ModalView: View {
    @Binding var audioPlayer: BgMusic?
    @Binding var showModal: Bool
    
    var body: some View {
        
        ScrollView(.vertical){
            VStack {
                Text(Translations.Titles.titleDescription).font(.system(.body, design: .rounded)).bold()
                    .padding(.bottom,10).accessibility(label: Text(Translations.Titles.titleDescription))
                Text(Translations.Titles.description)
                    .font(.system(.body, design: .rounded))
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 10).accessibility(label: Text(Translations.VoiceOver.modalOver))
                Button(Translations.Titles.buttonDescription, action: {
                    UserDefaults.standard.set(true, forKey: "hideModal")
                    self.showModal = false
                }).accessibility(label: Text(Translations.Titles.buttonDescription)).accessibility(addTraits: .isButton)
                .font(.system(.body, design: .rounded))
                .foregroundColor(Color.red)
                Button(Translations.Titles.buttonCancel, action: {
                    self.showModal = false
                }).accessibility(label: Text(Translations.VoiceOver.buttonCancelOver)).accessibility(addTraits: .isButton)
                .font(.system(.body, design: .rounded))
            }
        }
        .onDisappear {
            if self.showModal {
                self.audioPlayer?.play()
            }
        }
    }
}
