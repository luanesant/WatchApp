//
//  FiveSensesView.swift
//  WatchApp
//
//  Created by Radija Praia on 22/02/21.
//

import SwiftUI
import AVFoundation



struct FiveSensesView: View {
    @State var step: Int = 0
    @State var showModalView = true
    @State private var goToFeedback = false

//@State var audioPlayer: AVAudioPlayer?

    let tasksFiveSenses = [
    Translations.FiveSenesTexts.visionText,
    Translations.FiveSenesTexts.senseText,
    Translations.FiveSenesTexts.hearText,
    Translations.FiveSenesTexts.touchText,
    Translations.FiveSenesTexts.eatText
    ]
    
    var body: some View {
   
        VStack {
            Spacer()
            Progress5Senses(step: step).ignoresSafeArea(edges: .top)
            
            Text(tasksFiveSenses[step])
                .padding(.top, 20)
            
            
        Button(Translations.Titles.readyTitle, action: {
                
                if tasksFiveSenses.count - 1 > step {
                    self.step = self.step + 1
                } else if tasksFiveSenses.count - 1 == step {
                    self.goToFeedback = true
                }
                
            })
        .background(NavigationLink(
                              destination: FeedbackView(),
                              isActive: $goToFeedback) {
                              EmptyView()}.background(mainColorBlue))
        
        .padding(.bottom, 0)
        .foregroundColor(.black)
        
            
        }
        .navigationBarTitle(Translations.Titles.fiveSenses)
        
        //        .edgesIgnoringSafeArea(.all)
        //        .background(Color.red)
        .sheet(isPresented: $showModalView,content: {
            ModalView()
        })
//            .onAppear {
//        let sound = Bundle.main.path(forResource: "dolphin", ofType: "mp3")
//        self.audioPlayer = try! AVAudioPlayer (contentsOf: URL(fileURLWithPath: sound!))
        
    }
    
}

struct Progress5Senses: View {
    var step: Int
    
    let imageFiveSenses = [
        "senseEye",
        "senseHand",
        "senseNote",
        "senseInhale",
        "senseApple"
    ]
    
    var body: some View {
        ZStack
        {
        ProgressView(value:(Double(step + 1) * 0.2)).progressViewStyle(CircularProgressViewStyle(tint: .yellow))
                .scaleEffect(CGSize(width: 2.1, height: 2.1))
            
            VStack {
                Text("\(step + 1) / 5")
                    .font(.title2)
                Image(imageFiveSenses[step])
                   
            }
        }
    }
}

struct ModalView: View {
    
    var body: some View {
        VStack {
        Text(Translations.Titles.description)
        }
    }
}

struct FiveSensesView_Previews: PreviewProvider {
    static var previews: some View {
    FiveSensesView(step: 0)
    }
}

