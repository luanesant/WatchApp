//
//  FeedbackView.swift
//  WatchApp WatchKit Extension
//
//  Created by Radija Praia on 23/02/21.
//

import SwiftUI
import UIKit

struct FeedbackView: View {
    
    @State var emotion: String = Translations.Titles.emotionBad
    
    var body: some View {
        
        VStack {
            Text(Translations.Titles.feelTitle).accessibility(label: Text(Translations.VoiceOver.feelFeedBackOver))
                .font(.headline)
            ScrollView(.horizontal){
                HStack (spacing: 30) {
                    FeelView(imageEmotion: "bad", action: {
                        emotion = Translations.Titles.emotionBad
                    }).accessibility(label: Text(Translations.VoiceOver.badOver))
                    FeelView(imageEmotion: "good", action: {
                        emotion = Translations.Titles.emotionGood
                    }).accessibility(label: Text(Translations.VoiceOver.goodOver))
                    FeelView(imageEmotion: "happy", action: {
                        emotion = Translations.Titles.emotionBetter
                    }).accessibility(label: Text(Translations.VoiceOver.betterOver))
                
                }.padding().listStyle(CarouselListStyle())
            }
            Text(emotion).font(.subheadline)
            NavigationLink(destination: HomeView(), label: {
                Text(Translations.Titles.finishTitle).font(.body)
            }).accessibility(label: Text(Translations.VoiceOver.finishOver)).accessibility(addTraits: .isButton)
            .buttonStyle(BorderedButtonStyle(tint: mainColorBlue.opacity(200)))
            .foregroundColor(.black)

        }.navigationBarBackButtonHidden(true)
    }
    
}

struct FeelView: View {
    
    @State var imageEmotion: String
    @State var action: ()-> Void
    
    var body: some View {
        Button(action: action) {
            Image(imageEmotion)
        }
        .padding(5.0)
        .clipShape(Circle(), style: FillStyle())
        .background(Color.clear)
    
    }
}

struct FeedBack_Previews: PreviewProvider {
    static var previews: some View {
        FeedbackView(emotion: Translations.Titles.emotionBetter)
    }
}
