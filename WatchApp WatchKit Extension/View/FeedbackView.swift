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

                        emotion = Translations.Titles.emotionHappy
                    }).accessibility(label: Text(Translations.VoiceOver.betterOver))
                }

                
                }.padding().listStyle(CarouselListStyle())
            }
            Text(emotion).font(.subheadline)
        
        Button(action: {
           
            if emotion == Translations.Titles.emotionBad {
               show = true
            }
            else{
                
                chooseView = true
            }
            
        }, label: {
            Text(Translations.Titles.finishTitle).font(.body)
        }).background(NavigationLink("", destination: destine, isActive: $chooseView )).accessibility(label: Text(Translations.VoiceOver.finishOver)).accessibility(addTraits: .isButton)
            .buttonStyle(BorderedButtonStyle(tint: mainColorBlue.opacity(200)))
            .foregroundColor(.black)
        .navigationBarBackButtonHidden(true).sheet(isPresented: $show){
            ModalFeed()
        }//ve se ta certo

        }
    }

//struct Change: View {
//
//    var body: some View {
// HomeView()
//    }
//}

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
        FeedbackView( emotion: Translations.Titles.emotionHappy)
    }
}
