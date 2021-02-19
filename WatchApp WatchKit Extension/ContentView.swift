//
//  ContentView.swift
//  WatchApp WatchKit Extension
//
//  Created by Vinícius de Oliveira on 19/02/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Image(systemName: "heart")
        List(0..<2) { item in
                    
                    VStack(alignment: .leading) {
                        Text("Respiração Guiada")
                        Text("5 Sentidos").font(.subheadline)
                    }
                }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
