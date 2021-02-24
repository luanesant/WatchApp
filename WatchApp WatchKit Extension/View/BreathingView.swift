//
//  BreathingView.swift
//  WatchApp WatchKit Extension
//
//  Created by Vinícius de Oliveira on 19/02/21.
//

import SwiftUI
import WatchKit
import UIKit
struct BreathingView: View {
    @State var timeToBreath: Int
 
    var body: some View {
       
            VStack {
                if timeToBreath > 0 {
                    Text("Time to breath: ")
                    Text("\(timeToBreath)")
                        .onAppear(){
                            timeToBreath *= 60
                            Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) {(timer) in
                                if timeToBreath > 0 {
                                    timeToBreath -= 1
                                }
                            }
                        }
                }
                else {
                    FeedbackView()
                }
                
            }
            .navigationBarTitle("Breath")
    }
}

struct BreathingView_Previews: PreviewProvider {
    static var previews: some View {
        BreathingView(timeToBreath: 1)
    }
}
