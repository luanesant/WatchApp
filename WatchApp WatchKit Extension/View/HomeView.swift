//
//  HomeView.swift
//  WatchApp WatchKit Extension
//
//  Created by Vinícius de Oliveira on 19/02/21.
//

import SwiftUI
import AVFoundation

struct HomeView: View {
    
    @State var isActive: Bool = false
    @State var amount = 0.0
    @State var changeView = false
    var body: some View {
        
        VStack{
//            Image(systemName: "heart")
//                .padding(.bottom, 20)
//                .padding(.top,0).accessibility(label: Text(Translations.VoiceOver.heartOver))
            
            HeartRateView()

            Button(action: {
                changeView = true
            }, label: {
                HStack{
                    Image("lungs").padding(.leading,10)
                    Spacer()
                    Text(Translations.Titles.breath).foregroundColor(.white)
                    Spacer()
                }
                
            }).buttonStyle(BorderedButtonStyle(tint: bgButton.opacity(200))).background(NavigationLink("", destination: TimeToBreathView(), isActive: $changeView))
            .accessibility(label: Text(Translations.VoiceOver.breathOver)).buttonStyle(BorderedButtonStyle(tint: bgButton.opacity(200))).font(.body)

            NavigationLink(destination: FiveSensesView(showModalView: !UserDefaults.standard.bool(forKey: "hideModal"))) {
                HomeButton(image: "eye", text: Translations.Titles.fiveSenses).foregroundColor(.white)
            }.accessibility(label: Text(Translations.VoiceOver.sensesOver))
//            .buttonStyle(BorderedButtonStyle(tint: bgButton.opacity(200))).font(.body)
                        
        }.accessibility(label: Text("App Harmon"))
        .navigationBarBackButtonHidden(true)
        .navigationBarTitle(Translations.Titles.nameApp)
    }
}

struct HomeButton: View {
    
    @State var image: String
    @State var text: String
    var body: some View {
        HStack{
            Image(image)
                .padding(.leading,10).font(.body)
            Spacer()
            Text(text)
            Spacer()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}


