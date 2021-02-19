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
                HStack{
                    Image(systemName: "lungs.fill")
                        .padding(.trailing, 20)
                        Text("Respiração")
                            .multilineTextAlignment(.center)
                }
                ForEach (0..<1){
                    item in
                       HStack{
                        Image(systemName: "eyebrow")
                            .padding(.trailing,23)
                            Text("5 sentidos")
                                .multilineTextAlignment(.center)
                        }
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
