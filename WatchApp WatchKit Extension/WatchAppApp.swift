//
//  WatchAppApp.swift
//  WatchApp WatchKit Extension
//
//  Created by Vinícius de Oliveira on 19/02/21.
//

import SwiftUI
//import UIKit
//
//class AppDelegate: NSObject, UIApplicationDelegate {
//  func application(_ application: UIApplication,
//                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
//    print("Colors application is starting up. ApplicationDelegate didFinishLaunchingWithOptions.")
//    return true
//  }
//}

@main
struct WatchAppApp: App {
//    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
//    @Environment(\.scenePhase) var scenePhase
    
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
        }
        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
