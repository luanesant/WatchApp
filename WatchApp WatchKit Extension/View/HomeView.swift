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
                VStack{

                NavigationLink(destination: FeedBack(), label: {
                    HStack{
                    Image(systemName: "lungs.fill")
                        .padding(.leading,10)//.font(.title)
                    Spacer()
                    Text("Breath")
                    Spacer()
                }.foregroundColor(.white)

                }

                ).buttonStyle(PlainButtonStyle()).frame(height: 50.0).clipShape(Rectangle(), style: FillStyle()).background(Color.blue).foregroundColor(.white)

                NavigationLink(destination: Text("hey"), label: {
                    HStack{
                        Image(systemName: "eyebrow")
                            .padding(.leading,13)
                    Spacer()
                    Text("5 Senses")
                    Spacer()
                }.foregroundColor(.white)

                }

                ).buttonStyle(PlainButtonStyle()).frame(height: 50.0).clipShape(Rectangle(), style: FillStyle()).background(Color.blue).foregroundColor(.white)

            }.clipShape(RoundedRectangle(cornerSize: CGSize(width: 24, height: 1200), style: .circular))
            Divider()

            }

        }
    }
    
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}


