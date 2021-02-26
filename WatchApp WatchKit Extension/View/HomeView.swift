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
                ZStack{
                    VStack{
                        NavigationLink(destination: TimeToBreathView(), label: {
                            HomeButton(image: "lungs", text: Translations.Titles.breath)
                            
                        }
                        
                        ).buttonStyle(PlainButtonStyle()).frame(height: 50.0).clipShape(Rectangle(), style: FillStyle()).background(bgButton).foregroundColor(.white).navigationBarTitle(Translations.Titles.nameApp)
        
                        
                        NavigationLink(destination: FiveSensesView(), label: {
                            HomeButton(image: "eye", text: Translations.Titles.fiveSenses)
                            
                        }
                        
                        ).buttonStyle(PlainButtonStyle()).frame(height: 50.0).clipShape(Rectangle(), style: FillStyle()).background(bgButton).foregroundColor(.white)
                       
                        
                    }.clipShape(RoundedRectangle(cornerSize: CGSize(width: 24, height: 1200), style: .circular))
                    Divider()
                    
                }
                
            }.navigationBarBackButtonHidden(true)
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


