//
//  FiveSensesView.swift
//  WatchApp
//
//  Created by Radija Praia on 22/02/21.
//

import SwiftUI

struct FiveSensesView: View {
    
    @State var step: Int = 0
    @State var showModalView = false
    
    let tasksFiveSenses = [
        "Say 5 things you see",
        "Say 4 things you feel",
        "Say 3 things you hear",
        "Say 2 you smell",
        "Say 1 thing you eat"
    ]
    
    var body: some View {
      
        VStack {
            Spacer()
        Progress5Senses(step: step).ignoresSafeArea(edges: .top)
                
            Text(tasksFiveSenses[step])
                .padding(.top, 20)
            Button("Ready", action: {
                
                if tasksFiveSenses.count - 1 > step {
                    self.step = self.step + 1
                }
            })
            .padding(.bottom, 12)
        }
        
        .edgesIgnoringSafeArea(.all)
//        .background(Color.red)
        .sheet(isPresented: $showModalView,content: {
            ModalView()
        })
    }
}

struct Progress5Senses: View {
    var step: Int
    
    let emojisFiveSenses = [
        "👁",
        "🤚🏻",
        "🎵",
        "🐽",
        "😋"
    ]
    
    var body: some View {
        ZStack
        {
        ProgressView(value:(Double(step + 1) * 0.2)).progressViewStyle(CircularProgressViewStyle())
            .scaleEffect(CGSize(width: 2.1, height: 2.1))
            VStack {
                Text("\(step + 1) / 5")
                    .font(.title2)
                    
                    
                    
                Text(emojisFiveSenses[step])
                    .font(.title2)
            }
        }
    }
}

struct ModalView: View {

    var body: some View {
        VStack {
            Text("The technique of the 5 senses will help you focus on what's happening now. Look around and take a deep breath.")
        }
    }
}

struct FiveSensesView_Previews: PreviewProvider {
    static var previews: some View {
        FiveSensesView(step: 0)
    }
}
