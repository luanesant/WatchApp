//
//  HeartRateView.swift
//  WatchApp WatchKit Extension
//
//  Created by Vinícius de Oliveira on 04/03/21.
//

import Foundation
import SwiftUI
import HealthKit

struct HeartRateView: View {
    
    private var healthStore = HKHealthStore()
    let heartRateQuantity = HKUnit(from: "count/min")
    
    @State var rate = 0
    
    var body: some View {
        VStack{
            Image("heart")
            Text(rate == 0 ? "... BPM" : "\(rate) BPM")
                .bold()
        }
        .padding()
        .onAppear(perform: start)
    }

    
    func start() {
        autorizeHealthKit()
        DispatchQueue.main.async {
            startHeartRateQuery(quantityTypeIdentifier: .heartRate) { (sample, error) in
                guard let sample = sample else {
                    if let error = error {
                        print(error)
                    }
                    return
                }
                rate = Int((sample.quantity.doubleValue(for: heartRateQuantity)))
            }
        }
    }
}

struct HeartRate_Preview: PreviewProvider {
    static var previews: some View {
        HeartRateView()
    }
}
