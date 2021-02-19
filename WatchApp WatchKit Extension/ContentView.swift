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
            ForEach (0..<1){
                item in
                    VStack(alignment: .leading) {
                        Text("Respiração Guiada")
                }
                ForEach (0..<1){
                    item in
                        VStack(alignment: .leading) {
                            Text("5 sentidos")
                        }}
            }
                       // Text("5 Sentidos").font(.subheadline)
                  
                }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
