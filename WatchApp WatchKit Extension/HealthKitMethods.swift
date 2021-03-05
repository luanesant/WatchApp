//
//  HealthKitMethods.swift
//  WatchApp WatchKit Extension
//
//  Created by Vinícius de Oliveira on 05/03/21.
//

import Foundation
import SwiftUI
import HealthKit

private var healthStore = HKHealthStore()
let heartRateQuantity = HKUnit(from: "count/min")

func autorizeHealthKit() {
    let healthKitTypes: Set = [
    HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.heartRate)!]

    healthStore.requestAuthorization(toShare: healthKitTypes, read: healthKitTypes) { success, error in
        if !success {
            //Handle error
        }
    }
}

func startHeartRateQuery(quantityTypeIdentifier: HKQuantityTypeIdentifier, completion: @escaping (HKQuantitySample?, Error?) -> Swift.Void) {
    
    guard let sampleType = HKSampleType.quantityType(forIdentifier: .heartRate) else {
      print("Height Sample Type is no longer available in HealthKit")
      return
    }

    let mostRecentPredicate = HKQuery.predicateForSamples(withStart: Date.distantPast,
                                                          end: Date(),
                                                          options: .strictEndDate)

    let sortDescriptor = NSSortDescriptor(key: HKSampleSortIdentifierStartDate,
                                          ascending: false)

    let limit = 1

    let query = HKSampleQuery(sampleType: sampleType,
                                    predicate: mostRecentPredicate,
                                    limit: limit,
                                    sortDescriptors: [sortDescriptor]) { (query, samples, error) in

      //2. Always dispatch to the main thread when complete.
      DispatchQueue.main.async {

        guard let samples = samples,
              let mostRecentSample = samples.first as? HKQuantitySample else {

              completion(nil, error)
              return
        }

        completion(mostRecentSample, nil)
      }
    }
    
    HKHealthStore().execute(query)
  }
