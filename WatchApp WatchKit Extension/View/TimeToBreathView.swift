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
            Text(Translations.Titles.timeTitle).padding(.all,0)
            Picker("", selection: $timeToBreath ) {
                Text(Translations.Titles.minute1).tag(1)
                Text(Translations.Titles.minute2).tag(2)
                Text(Translations.Titles.minute3).tag(3)
                Text(Translations.Titles.minute4).tag(4)
                Text(Translations.Titles.minute5).tag(5)
            }.pickerStyle(WheelPickerStyle()).focusable()
            .padding(.all,0)
            
            Button(Translations.Titles.titleStart,action:{
                secondScreenShown = true
            }).buttonStyle(BorderedButtonStyle(tint: mainColorBlue.opacity(200)))
                .foregroundColor(.black).background(NavigationLink("", destination: BreathingView(timeToBreath: timeToBreath),
                isActive: $secondScreenShown))
        }.navigationBarTitle(Translations.Titles.breath).padding(.bottom,0)
    }
}


struct TimeButton: View {
    
    @State var text: String
    var body: some View {
        
            Text(text)
         
        
//        .foregroundColor(.white)
    }
}

struct TimeToBreathView_Previews: PreviewProvider {
    static var previews: some View {
        TimeToBreathView()
    }
}


