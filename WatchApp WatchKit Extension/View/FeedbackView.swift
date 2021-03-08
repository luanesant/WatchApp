//
//  FeedbackView.swift
//  WatchApp WatchKit Extension
//
//  Created by Radija Praia on 23/02/21.
//

import SwiftUI
import UIKit

var destine = HomeView()

struct FeedbackView: View {
    @State var emotion: String = Translations.Titles.emotionBad
    @State var chooseView = false
    @State var show = false
    @State var currentEmotion = "bad"
    @State var emotions = [
        "bad", "good", "happy"
    ]
    @State var emotionsLabel = [
        Translations.Titles.emotionBad,
        Translations.Titles.emotionGood,
        Translations.Titles.emotionHappy
    ]
    @State var emotionsVoice = [
        Translations.VoiceOver.badOver,
        Translations.VoiceOver.goodOver,
        Translations.VoiceOver.betterOver
    ]
    
    var body: some View {
        
        VStack {
            Text(Translations.Titles.feelTitle)
                .offset(y: 14)
                .frame(width: 200.0)
                .accessibility(label: Text(Translations.VoiceOver.feelFeedBackOver))
                .font(.headline)
            List {
                ForEach((0...2), id: \.self) { i in
                    FeelView(imageEmotion: emotions[i], action: {
                        currentEmotion = emotions[i]
                        emotion = emotionsLabel[i]
                    }, currentEmotion: $currentEmotion)
                    .accessibility(label: Text(emotionsVoice[i]))
                }
                .listRowBackground(Color.clear)
                .padding(.all, 10)
            }
            .offset(y: -55)
            .padding(.top, 55.0)
            .padding(.bottom, -55.0)
            .frame(width:85, height: 100, alignment: .center)
            .rotationEffect(.degrees(-90))
            .listStyle(CarouselListStyle())
            
            Text(emotion)
                .padding(0.0)
                .frame(width: 200.0)
                .offset(y: -16)
                .font(.subheadline)
                
            Button(action: {
                
                if emotion == Translations.Titles.emotionBad {
                    show = true
                } else {
                    chooseView = true
                }
                
            }, label: {
                Text(Translations.Titles.finishTitle).font(.body)
            }).background(NavigationLink("", destination: destine, isActive: $chooseView )).accessibility(label: Text(Translations.VoiceOver.finishOver)).accessibility(addTraits: .isButton)
            .buttonStyle(BorderedButtonStyle(tint: mainColorBlue.opacity(200)))
            .offset(y: -10)
            .foregroundColor(.black)
            .navigationBarBackButtonHidden(true).sheet(isPresented: $show){
                ModalFeed()
            }
        }
    }
}

struct FeelView: View {
    
    @State var imageEmotion: String
    @State var action: ()-> Void
    @Binding var currentEmotion: String
    
    var body: some View {
        Button(action: action) {
            ZStack {
                Image(imageEmotion)
                    .rotationEffect(.degrees(90))
                    .padding(1)
//                if imageEmotion == currentEmotion {
//                    Circle()
//                        .stroke(lineWidth: 2)
//                        .frame(width: 60, height: 60, alignment: .center)
//                }
            }
        }
    }
}

struct FeedBack_Previews: PreviewProvider {
    static var previews: some View {
        FeedbackView( emotion: Translations.Titles.emotionBad)
    }
}
