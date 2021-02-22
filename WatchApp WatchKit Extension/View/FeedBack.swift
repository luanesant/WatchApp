//
//  FeedBack.swift
//  WatchApp WatchKit Extension
//
//  Created by Luane dos Santos on 19/02/21.
//

import SwiftUI

struct FeedBack: View {
    var body: some View {
        ScrollView(.horizontal){
            HStack{
                Button(action: {
                    
                }, label: {
                    Image(systemName: "return").frame(minWidth: 80, minHeight: 80)//background(Color.gray).clipShape(Circle())
                }).clipShape(Circle(), style: FillStyle()).background(Color.clear).buttonStyle(BorderedButtonStyle(tint: .blue))
                
                Button(action: {
                    
                }, label: {
                    Image(systemName: "return").frame(minWidth: 80, minHeight: 80)//background(Color.gray).clipShape(Circle())
                }).clipShape(Circle(), style: FillStyle()).background(Color.clear).buttonStyle(BorderedButtonStyle(tint: .blue))
                
                Button(action: {
                    
                }, label: {
                    Image(systemName: "return").frame(minWidth: 80, minHeight: 80)//background(Color.gray).clipShape(Circle())
                }).clipShape(Circle(), style: FillStyle()).background(Color.clear).buttonStyle(BorderedButtonStyle(tint: .blue))
                
//                Image(systemName: "return").frame(minWidth: 80, minHeight: 80).background(Color.gray).clipShape(Circle())
//                Image(systemName: "return").frame(minWidth: 80, minHeight: 80).background(Color.gray).clipShape(Circle())
                
            }.padding().listStyle(CarouselListStyle())
        }
    }}

struct FeedBack_Previews: PreviewProvider {
    static var previews: some View {
        FeedBack()
    }
}
