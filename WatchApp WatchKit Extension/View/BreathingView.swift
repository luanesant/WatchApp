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
    @State var timeToBreath = 1
 
    var body: some View {
       
            VStack {
                Text("timeTile")
                Text("\(timeToBreath)")
            }.colorMultiply(.blue)
        .navigationBarTitle("breathTitle")
    }
}

struct BreathingView_Previews: PreviewProvider {
    static var previews: some View {
        BreathingView()
    }
}
