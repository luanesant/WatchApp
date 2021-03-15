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
    @State var emotions = ["zero",
        "bad", "good", "happy","zero"
    ]
    @State var emotionsLabel = [
        Translations.Titles.emotionBad,
        Translations.Titles.emotionBad,
        Translations.Titles.emotionGood,
        Translations.Titles.emotionHappy
,        Translations.Titles.emotionHappy
    ]
    @State var emotionsVoice = [Translations.VoiceOver.badOver,
        Translations.VoiceOver.badOver,
        Translations.VoiceOver.goodOver,
        Translations.VoiceOver.betterOver,        Translations.VoiceOver.betterOver
    ]
    
    var body: some View {
  
          
        VStack {
           
                
            Text(Translations.Titles.feelTitle)
                .offset(y: 21)
//                .frame(width: 200.0)
                .accessibility(label: Text(Translations.VoiceOver.feelFeedBackOver))
                .font(.system(.headline, design: .rounded))
            ZStack{
                
                List {
                ForEach((0...3), id: \.self) { i in
                    FeelView(imageEmotion: emotions[i], action: {
                        currentEmotion = emotions[i]
                        emotion = emotionsLabel[i]
                        
                    }, currentEmotion: $currentEmotion)
                    .accessibility(label: Text(emotionsVoice[i]))
                    
                }
                .offset(x: -9.0)
                .listRowBackground((Color.clear.opacity(0)))
                .padding(.vertical, 1).padding(.horizontal,10)
                
            }
            .background(Color.clear.opacity(0))
            .offset(y: -55)
            .padding(.top, 55.0)
            .padding(.bottom, -55.0)
            .frame(width:70, height: 100, alignment: .center)
            .rotationEffect(.degrees(-90))
            .listStyle(CarouselListStyle())
                Circle()
                    .stroke(Color.white, lineWidth: 5).frame(width: 60).offset(y: 1) }
            Text(emotion)
                .lineLimit(0)
                .padding(0.0)
                .frame(width: 200.0)
                .offset(y: -18)
                .font(.system(.subheadline, design: .rounded))
                
            Button(action: {
                
                if emotion == Translations.Titles.emotionBad {
                    show = true
                } else {
                    chooseView = true
                }
                
            }, label: {
                Text(Translations.Titles.finishTitle).font(.system(.body, design: .rounded))
            }).background(NavigationLink("", destination: destine, isActive: $chooseView )).accessibility(label: Text(Translations.VoiceOver.finishOver)).accessibility(addTraits: .isButton)
            .buttonStyle(BorderedButtonStyle(tint: mainColorBlue.opacity(200)))
            .offset(y: -20)
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
            }.background((Color.clear.opacity(0)))
        }.background((Color.clear.opacity(0)))
    }
}

struct FeedBack_Previews: PreviewProvider {
    static var previews: some View {
        FeedbackView( emotion: Translations.Titles.emotionBad)
    }
}
