//
//  UserStore.swift
//  DemoApp
//
//  Created by Aybars Acar on 22/4/2022.
//

import Foundation

final class UserStore: ObservableObject {
  @Published var isLoggedIn = false
  @Published var showLogin = false
}
