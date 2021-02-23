//
//  TimeToBreathView.swift
//  WatchApp WatchKit Extension
//
//  Created by Vinícius de Oliveira on 19/02/21.
//

import SwiftUI

struct TimeToBreathView: View {
    @State var secondScreenShown = false
    @State var timeToBreath = 1
   
    var body: some View {
        VStack {
            Text("Time to breath").padding([.top, .leading, .bottom],0)
            Picker("", selection: $timeToBreath ) {
                Text("1 minute").tag(1)
                Text("2 minutes").tag(2)
                Text("3 minutes").tag(3)
                Text("4 minutes").tag(4)
                Text("5 minutes").tag(5)
            }.pickerStyle(WheelPickerStyle()).focusable()
            .padding(.vertical,0)
            NavigationLink(
                destination: BreathingView(timeToBreath: timeToBreath),
                isActive: $secondScreenShown,
                label: {
                    Text("Start")
                }).navigationBarTitle("Breath")
        }
    }
}

struct TimeToBreathView_Previews: PreviewProvider {
    static var previews: some View {
        TimeToBreathView()
    }
}


