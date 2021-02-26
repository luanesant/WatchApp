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
    @State var goToHome: Bool = false
    
    var body: some View {
        
        VStack {
            Text(Translations.Titles.feelTitle)
                .font(.headline)
            ScrollView(.horizontal){
                HStack (spacing: 30) {
                    FeelView(imageEmotion: "bad", action: {
                        emotion = Translations.Titles.emotionBad
                    })
                    FeelView(imageEmotion: "good", action: {
                        emotion = Translations.Titles.emotionGood
                    })
                    FeelView(imageEmotion: "happy", action: {
                        emotion = Translations.Titles.emotionBetter
                    })
                    
                    //                    Button(action: {
                    //                    }, label: {
                    //                        Image(systemName: "return").frame(minWidth: 80, minHeight: 80)//background(Color.gray).clipShape(Circle())
                    //                    }).clipShape(Circle(), style: FillStyle()).background(Color.clear).buttonStyle(BorderedButtonStyle(tint: .blue))
                
                }.padding().listStyle(CarouselListStyle())
            }
            Text(emotion)
            Button(Translations.Titles.finishTitle, action:{}).buttonStyle(BorderedButtonStyle(tint: mainColorBlue.opacity(200)))
                .foregroundColor(.black).background(NavigationLink(
                            "", destination: HomeView(),
                            isActive: $goToHome))
        }
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
//        .scaleEffect(CGSize(width: 2, height: 2))
        .background(Color.clear)
       // .buttonStyle(BorderedButtonStyle(tint: .blue))
    
    }
}

struct FeedBack_Previews: PreviewProvider {
    static var previews: some View {
        FeedbackView(emotion: Translations.Titles.emotionBetter)
    }
}
