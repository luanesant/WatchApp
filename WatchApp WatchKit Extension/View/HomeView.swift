//
//  HomeView.swift
//  WatchApp WatchKit Extension
//
//  Created by Vinícius de Oliveira on 19/02/21.
//

import SwiftUI
import UIKit

struct HomeView: View {
    
    
    var body: some View {
        VStack{
            Image(systemName: "heart").padding(.bottom, 20).padding(.top,0)
            ZStack{
                List{
                ForEach (0..<2) {item in
                    switch item {
                    case 0:
                        HStack{
                            TableViewButton(iconImage: "lungs.fill", buttonTitle: "Breath")
                            NavigationLink("",destination: FeedBack())
                        }
                        
                    case 1:
                        TableViewButton(iconImage: "eyebrow", buttonTitle: "5 senses")
                    default:
                        TableViewButton(iconImage: "", buttonTitle: "")
                    }
                    
                }.frame(height: 50.0).listRowBackground(Color.pink)
                    
                   
                }.clipShape(RoundedRectangle(cornerSize: CGSize(width: 24, height: 1200), style: .circular)).listStyle(CarouselListStyle())
                Divider()
                Divider()
            }
            
        }//.listStyle(CarouselListStyle())
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
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

