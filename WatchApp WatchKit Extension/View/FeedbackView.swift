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
    @State var emotionsVoice = [Translations.VoiceOver.badOver,
        Translations.VoiceOver.goodOver,
        Translations.VoiceOver.betterOver
    ]
    @State var scroll = 0.0

    var body: some View {
        VStack {
            Text(Translations.Titles.feelTitle)
                .offset(y: 10)
//                .frame(width: 200.0)
                .accessibility(label: Text(Translations.VoiceOver.feelFeedBackOver))
                .font(.system(.headline, design: .rounded))
            ZStack{
                
                List {
               
                ForEach((0...2), id: \.self) { i in
                    FeelView(imageEmotion: emotions[i], textEmotion: emotionsLabel[i], action: {
                        currentEmotion = emotions[i]
                        
                    }, currentEmotion: $currentEmotion)
                    .accessibility(label: Text(emotionsVoice[i]))

                }
                .offset(x: 0.0)
                .listRowBackground((Color.clear.opacity(0)))
                .padding(.vertical, 10).padding(.horizontal,10)
                   

                }
            .background(Color.clear.opacity(0))
            .offset(y: -55)
            .padding(.top, 55.0)
            .padding(.bottom, -55.0)
            .frame(width:70, height: 100, alignment: .center)
            .rotationEffect(.degrees(-90))
                .listStyle(CarouselListStyle())
               
//              //  Circle()
//              //      .stroke(Color.white, lineWidth: 5).frame(width: 60).offset(y: 1)
                
            }.offset(y: -8)


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
            .offset(y: -12)
            .foregroundColor(.black)
            .navigationBarBackButtonHidden(true).sheet(isPresented: $show){
                ModalFeed().navigationBarHidden(true)
            }
            
        
        }
    }
}

struct FeelView: View {
    
    @State var imageEmotion: String
    @State var textEmotion: String

    @State var action: ()-> Void
    @Binding var currentEmotion: String
    
    var body: some View {
        Button(action: action) {
            ZStack {
                
                Image(imageEmotion)
                    .rotationEffect(.degrees(90))
                    .padding(1)
                    Text(textEmotion).rotationEffect(.degrees(90)).offset(x: -35)
            }.background((Color.clear.opacity(0)))
        }.background((Color.clear.opacity(0)))
    }
}

struct FeedBack_Previews: PreviewProvider {
    static var previews: some View {
        FeedbackView( emotion: Translations.Titles.emotionBad)
        }
    }

