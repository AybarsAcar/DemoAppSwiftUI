//
//  Post.swift
//  DemoApp
//
//  Created by Aybars Acar on 11/4/2022.
//

import Foundation

struct Post: Identifiable, Codable {
  let title: String
  let body: String
  
  var id: UUID {
    return UUID()
  }
}
