//
//  FeedbackView.swift
//  WatchApp WatchKit Extension
//
//  Created by Radija Praia on 23/02/21.
//

import SwiftUI
import UIKit

struct FeedbackView: View {
    
    @State var emotion: String = "emotionBad"
    @State var goToHome: Bool = false
    
    var body: some View {
        
        VStack {
            Text("feelTitle")
                .font(.headline)
            ScrollView(.horizontal){
                HStack (spacing: 30) {
                    FeelView(emoji: "😖", action: {
                        emotion = "emotionBad"
                    })
                    FeelView(emoji: "🙂", action: {
                        emotion = "emotionGood"
                    })
                    FeelView(emoji: "😊", action: {
                        emotion = "emotionBetter"
                    })
                    
                    //                    Button(action: {
                    //                    }, label: {
                    //                        Image(systemName: "return").frame(minWidth: 80, minHeight: 80)//background(Color.gray).clipShape(Circle())
                    //                    }).clipShape(Circle(), style: FillStyle()).background(Color.clear).buttonStyle(BorderedButtonStyle(tint: .blue))
                
                }.padding().listStyle(CarouselListStyle())
            }
            Text(emotion)
            NavigationLink(
                            destination: HomeView(),
                            isActive: $goToHome,
                            label: {
                                Text("finishTitle")
                            }).navigationBarBackButtonHidden(true)
        }
    }
    
}

struct FeelView: View {
    
    @State var emoji: String
    @State var action: ()-> Void
    
    var body: some View {
    Button(emoji, action: action)
        .padding(5.0)
        .clipShape(Circle(), style: FillStyle())
        .scaleEffect(CGSize(width: 2, height: 2))
        .background(Color.clear)
        .buttonStyle(BorderedButtonStyle(tint: .blue))
    
    }
}

struct FeedBack_Previews: PreviewProvider {
    static var previews: some View {
        FeedbackView(emotion: "emotionBetter")
    }
}
