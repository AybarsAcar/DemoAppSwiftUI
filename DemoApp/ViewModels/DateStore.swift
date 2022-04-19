//
//  DateStore.swift
//  DemoApp
//
//  Created by Aybars Acar on 12/4/2022.
//

import Foundation

final class DateStore: ObservableObject {
  @Published var post = [Post]()
  
  init() {
    getPosts()
  }
  
  func getPosts() {
    APIService.shared.getPosts { [weak self] posts in
      DispatchQueue.main.async {
        self?.post = posts
      }
    }
  }
}
