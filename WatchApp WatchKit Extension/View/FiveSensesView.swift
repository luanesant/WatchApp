//
//  FiveSensesView.swift
//  WatchApp
//
//  Created by Radija Praia on 22/02/21.
//

import SwiftUI

struct FiveSensesView: View {
    
    @State var step: Double = 0.0
    
    var body: some View {
        VStack {
            Progress5Senses(step: step)
            Text("blábláblá")
            Button("Pronto", action: {
                self.step = self.step + 0.20
            })
        }
    }
}

struct Progress5Senses: View {
    var step: Double
    var body: some View {
        ProgressView(value:step).progressViewStyle(CircularProgressViewStyle())
    }
}


struct FiveSensesView_Previews: PreviewProvider {
    static var previews: some View {
        FiveSensesView(step: 0.20)
    }
}
