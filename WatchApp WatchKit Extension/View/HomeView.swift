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
//            ZStack{
//                List{
//                ForEach (0..<2) {item in
//                    switch item {
//                    case 0:
//                        HStack{
//                            TableViewButton(iconImage: "lungs.fill", buttonTitle: "Breath")
//                            NavigationLink("",destination: FeedBack())
//                        }
//
//                    case 1:
//                        TableViewButton(iconImage: "eyebrow", buttonTitle: "5 senses")
//                        NavigationLink("",destination: Text("hey"))
//                    default:
//                        TableViewButton(iconImage: "", buttonTitle: "")
//                    }
//
//                }.frame(height: 50.0).listRowBackground(Color.pink)
//
//
//                }.clipShape(RoundedRectangle(cornerSize: CGSize(width: 24, height: 1200), style: .circular)).listStyle(CarouselListStyle())
//            Divider()
//            Divider()
//            }

//        }//.listStyle(CarouselListStyle())
            Spacer()
            List {
                NavigationLink(destination: FeedBack(), label: {
                    TableViewButton(iconImage: "lungs.fill", buttonTitle: "Breath")
                        .frame(width: 140, height: 44)
                })
                .frame(height: 50.0)
                .listRowBackground(Color.blue)
        
                NavigationLink(destination: FiveSensesView(), label: {
                    TableViewButton(iconImage: "eyebrow", buttonTitle: "5 senses")
                        .frame(width: 140, height: 44)
                })
                .frame(height: 50.0)
                .listRowBackground(Color.blue)
            }
            .clipShape(RoundedRectangle(cornerSize: CGSize(width: 24, height: 1200), style: .circular))
            .listStyle(CarouselListStyle())
        }
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
        HStack(alignment: .center, spacing: 0, content: {
            Image(systemName: iconImage)
                .frame(width: 25, height: 25, alignment: .center)
                .padding(.trailing, 20)
                .padding(.leading, 20)
            Text(buttonTitle)
                .multilineTextAlignment(.leading)
            Spacer()
        })
    }
}

