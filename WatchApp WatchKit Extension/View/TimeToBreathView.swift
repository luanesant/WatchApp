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
            Text(Translations.Titles.timeTitle).padding(.all,0).font(.title3).accessibility(label: Text(Translations.VoiceOver.timeOver))
            Picker("", selection: $timeToBreath ) {
                Text(Translations.Titles.minute1).tag(1).font(.title3)
                Text(Translations.Titles.minute2).tag(2).font(.title3)
                Text(Translations.Titles.minute3).tag(3).font(.title3)
                Text(Translations.Titles.minute4).tag(4).font(.title3)
                Text(Translations.Titles.minute5).tag(5).font(.title3)
            }.accessibility(label: Text(Translations.VoiceOver.pickerOver)).pickerStyle(WheelPickerStyle()).focusable()
            .padding(.all,0)
            
            Button(Translations.Titles.titleStart,action:{
                secondScreenShown = true
            }).accessibility(label: Text(Translations.VoiceOver.initOver)).buttonStyle(BorderedButtonStyle(tint: mainColorBlue.opacity(200)))
                .foregroundColor(.black).background(NavigationLink("", destination: BreathingView(timeToBreath: $timeToBreath),
                                                                   isActive: $secondScreenShown)).font(.body)
        }.padding(.all,0).navigationBarTitle(Translations.Titles.breath).padding(.bottom,0)
    }
}


struct TimeButton: View {
    
    @State var text: String
    var body: some View {
        
        Text(text).font(.body)
    }
}

struct TimeToBreathView_Previews: PreviewProvider {
    static var previews: some View {
        TimeToBreathView()
    }
}


