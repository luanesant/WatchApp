//
//  HomeView.swift
//  WatchApp WatchKit Extension
//
//  Created by Vinícius de Oliveira on 19/02/21.
//

import SwiftUI

struct HomeView: View {
    
    
    var body: some View {
        
        VStack{
            Image(systemName: "heart").padding(.bottom, 20).padding(.top,0)
            
            NavigationLink(destination: TimeToBreathView(),label: {
               
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundColor(.white)
                        .opacity(0)
                        .background(bgButton)
                        .cornerRadius(20)
                    HomeButton(image: "lungs", text: Translations.Titles.breath)
                }
            }).foregroundColor(.white)
            NavigationLink(destination: FiveSensesView(),label: {
                
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundColor(.white)
                        .opacity(0)
                        .background(bgButton)
                        .cornerRadius(20)
                    HomeButton(image: "eye", text: Translations.Titles.fiveSenses)
                }
            })
                        
                    }
                    .buttonStyle(PlainButtonStyle())
    }
}

struct HomeButton: View {
    
    @State var image: String
    @State var text: String
    var body: some View {
        HStack{
            Image(image)
                .padding(.leading,10)//.font(.title)
            Spacer()
            Text(text)
            Spacer()
        }
//        .foregroundColor(.white)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}


