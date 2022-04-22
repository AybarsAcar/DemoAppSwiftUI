//
//  DemoAppApp.swift
//  DemoApp
//
//  Created by Aybars Acar on 9/4/2022.
//

import SwiftUI
import Firebase

@main
struct DemoAppApp: App {
  
  @StateObject private var userStore = UserStore()
  
  init() {
    FirebaseApp.configure()
  }
  
  var body: some Scene {
    WindowGroup {
      TabBar()
        .environmentObject(userStore)
    }
  }
}
