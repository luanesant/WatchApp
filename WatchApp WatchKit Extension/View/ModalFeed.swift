//
//  ModalFeed.swift
//  WatchApp WatchKit Extension
//
//  Created by Luane dos Santos on 05/03/21.
//

import SwiftUI

struct ModalFeed: View {
    @State var show = false
    var body: some View {
        ScrollView{
        VStack{
            Image("modalrosto").padding([.top, .bottom],0)
     
            Text(Translations.Titles.textModalFeed).accessibility(label: Text(Translations.VoiceOver.textModalFeedOver))
                .multilineTextAlignment(.center)
                .lineLimit(3)
            
            Button(action: {
             show = true
            }, label: {
                Text(Translations.Titles.goTitle).font(.body)
            }).background(NavigationLink("", destination: TimeToBreathView(),isActive: $show)).accessibility(label: Text(Translations.VoiceOver.goTitleOver)).accessibility(addTraits: .isButton)
                .buttonStyle(BorderedButtonStyle(tint: bgButton.opacity(200)))
                .foregroundColor(.white)
        
        Button(action: {
            show = true
        }, label: {
            Text(Translations.Titles.buttonCancel).font(.body)
        }).padding(.bottom,0).background(NavigationLink("", destination: HomeView(),isActive: $show)).accessibility(label: Text(Translations.VoiceOver.buttonCancelOver)).accessibility(addTraits: .isButton)
            .buttonStyle(BorderedButtonStyle(tint: bgButton.opacity(200)))
            .foregroundColor(.red)
            }
        }
    }
    
}

struct ModalFeed_Previews: PreviewProvider {
    static var previews: some View {
      ModalFeed()
    }
}