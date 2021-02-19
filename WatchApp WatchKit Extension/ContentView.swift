//
//  ContentView.swift
//  WatchApp WatchKit Extension
//
//  Created by Vinícius de Oliveira on 19/02/21.
//

import SwiftUI

struct ContentView: View {
    @State var secondScreenShown = false

    var body: some View {
        HomeView()
        VStack{
            Image(systemName: "heart").padding(.bottom, 50)
            
        List {
            ForEach (0..<2) {item in
                switch item {
                case 0:
                    HStack{
                        TableViewButton(iconImage: "lungs.fill", buttonTitle: "Breath")
                        NavigationLink("",destination: TimeToBreathView())
                            
                    }
                case 1:
                    TableViewButton(iconImage: "eyebrow", buttonTitle: "5 senses")
                default:
                    TableViewButton(iconImage: "", buttonTitle: "")
                }
                }
            }
        }
    }
    
  
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
