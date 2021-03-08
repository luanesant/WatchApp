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

            Text(Translations.Titles.timeTitle).padding(.all,0).font(.system(.body, design: .rounded))
            .accessibility(label: Text(Translations.VoiceOver.timeOver))
            Picker("", selection: $timeToBreath ) {
                Text(Translations.Titles.minute1).tag(1).font(.body)
                Text(Translations.Titles.minute2).tag(2).font(.body)
                Text(Translations.Titles.minute3).tag(3).font(.body)
                Text(Translations.Titles.minute4).tag(4).font(.body)
                Text(Translations.Titles.minute5).tag(5).font(.body)
            }.accessibility(label:
            Text(Translations.VoiceOver.pickerOver)).pickerStyle(WheelPickerStyle()).focusable()
            
//            Text(Translations.VoiceOver.pickerOver)).accessibility(addTraits: .isButton).pickerStyle(WheelPickerStyle()).focusable()

            .padding(.all,0)
            
            Button(Translations.Titles.titleStart,action:{
                secondScreenShown = true
            }).accessibility(label: Text(Translations.VoiceOver.initOver)).buttonStyle(BorderedButtonStyle(tint: mainColorBlue.opacity(200)))
                .foregroundColor(.black).background(NavigationLink("", destination: BreathingView(timeToBreath: timeToBreath*60),
                                                                   isActive: $secondScreenShown)).font(.system(.body, design: .rounded))
        }.padding(.all,0).navigationBarTitle(Translations.Titles.breath).padding(.bottom,0)
    }
}


struct TimeButton: View {
    
    @State var text: String
    var body: some View {
        
        Text(text).font(.system(.body, design: .rounded))
    }
}

struct TimeToBreathView_Previews: PreviewProvider {
    static var previews: some View {
        TimeToBreathView()
    }
}


