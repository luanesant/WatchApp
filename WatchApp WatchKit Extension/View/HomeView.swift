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
    var body: some View {
        
        VStack{
//            Image(systemName: "heart")
//                .padding(.bottom, 20)
//                .padding(.top,0)

            Text("SCROLL: \(amount)").focusable(true).digitalCrownRotation($amount, from: 1, through: 5, by: 0.1,sensitivity: .low, isContinuous: true, isHapticFeedbackEnabled: true)
            NavigationLink(destination: TimeToBreathView()) {
                HomeButton(image: "lungs", text: Translations.Titles.breath).foregroundColor(.white)
            }
            .buttonStyle(BorderedButtonStyle(tint: bgButton.opacity(200)))

            NavigationLink(destination: FiveSensesView()) {
                HomeButton(image: "eye", text: Translations.Titles.fiveSenses).foregroundColor(.white)
            }
            .buttonStyle(BorderedButtonStyle(tint: bgButton.opacity(200)))
                        
        }
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
                .padding(.leading,10)//.font(.title)
            Spacer()
            Text(text)
            Spacer()
        }
//        .foregroundColor(.white)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}


