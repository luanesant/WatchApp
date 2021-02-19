//
//  ContentView.swift
//  WatchApp WatchKit Extension
//
//  Created by Vinícius de Oliveira on 19/02/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
            Image(systemName: "heart").padding(.bottom, 50)
            
        List {
            ForEach (0..<2) {item in
                switch item {
                case 0:
                    TableViewButton(iconImage: "lungs.fill", buttonTitle: "Breath")
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

struct TableViewButton: View {
    var iconImage: String
    var buttonTitle: String
    
    var body: some View {
        HStack{
            Image(systemName: iconImage)
                .padding(.trailing, 20)
                Text(buttonTitle)
                    .multilineTextAlignment(.center)
        }
    }
}
