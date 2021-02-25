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
            Text("timeTitle").padding(.all,0)
            Picker("", selection: $timeToBreath ) {
                Text("minute1").tag(1)
                Text("minute2").tag(2)
                Text("minute3").tag(3)
                Text("minute4").tag(4)
                Text("minutes5").tag(5)
            }.pickerStyle(WheelPickerStyle()).focusable()
            .padding(.all,0)
            NavigationLink(
                destination: BreathingView(timeToBreath: timeToBreath),
                isActive: $secondScreenShown,
                label: {
                    Text("titleStart")
                }).navigationBarTitle("breathTitle").padding(.bottom,0)
        }
    }
}

struct TimeToBreathView_Previews: PreviewProvider {
    static var previews: some View {
        TimeToBreathView()
    }
}


