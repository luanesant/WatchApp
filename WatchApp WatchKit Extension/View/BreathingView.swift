//
//  BreathingView.swift
//  WatchApp WatchKit Extension
//
//  Created by Vinícius de Oliveira on 19/02/21.
//

import SwiftUI

struct BreathingView: View {
    var body: some View {
        Text("Time to breath")
        NavigationLink(
            destination: Text("Destination"),
            label: {
                Text("Navigate")
            })
            .navigationTitle("Title")
    }
}

struct BreathingView_Previews: PreviewProvider {
    static var previews: some View {
        BreathingView()
    }
}
