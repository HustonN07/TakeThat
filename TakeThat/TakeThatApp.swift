//
//  TakeThatApp.swift
//  TakeThat
//
//  Created by nick on 11/6/25.
//

import SwiftUI
import SwiftData
import FirebaseCore
class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}
@main
struct YourApp: App {
  // register app delegate for Firebase setup
  @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate


  var body: some Scene {
    WindowGroup {
      NavigationView {
        ContentView()
      }
    }
  }
}


struct TakeThatApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject var auth = AuthViewModel()

    var body: some Scene {
        WindowGroup {
            if auth.user != nil {
                ContentView() // user is logged in → show feed
            } else {
                LoginView(auth: auth) // user not logged in → show login
            }
        }
    }
}


    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
