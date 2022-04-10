//
//  UpdateStore.swift
//  DemoApp
//
//  Created by Aybars Acar on 10/4/2022.
//

import SwiftUI
import Combine

final class UpdateStore: ObservableObject {
  @Published var updates: [Update] = Update.mockData
}
