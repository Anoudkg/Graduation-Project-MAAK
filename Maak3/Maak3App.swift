//
//  Maak3App.swift
//  Maak3
//
//  Created by Alanoudkhalid on 20/07/1444 AH.
//

import SwiftUI
import Firebase
import FirebaseCore
import FirebaseFirestore
import FirebaseDatabase
import FirebaseAuth


class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}

@main
struct Maak2App: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

    var body: some Scene {
        WindowGroup {
            TypeOfLoginView()
            //DocTabBar()
            //DoctorSearch()
        }
    }
}
