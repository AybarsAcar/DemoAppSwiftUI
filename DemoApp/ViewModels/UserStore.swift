//
//  UserStore.swift
//  DemoApp
//
//  Created by Aybars Acar on 22/4/2022.
//

import Foundation

final class UserStore: ObservableObject {
  @Published var isLoggedIn: Bool = UserDefaults.standard.bool(forKey: "isLoggedIn") {
    didSet {
      UserDefaults.standard.set(self.isLoggedIn, forKey: "isLoggedIn")
    }
  }
  @Published var showLogin = false
}
