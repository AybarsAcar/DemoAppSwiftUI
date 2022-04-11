//
//  APIService.swift
//  DemoApp
//
//  Created by Aybars Acar on 11/4/2022.
//

import Foundation

class APIService {
  static let shared = APIService()
  private init() { }
  
  func getPosts(completion: @escaping (_ posts: [Post]) -> Void) {
    guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
    
    let task = URLSession.shared.dataTask(with: url) { data, _, error in
      guard let data = data, error == nil else {
        return
      }
      
      do {
        let posts = try JSONDecoder().decode([Post].self, from: data)
        completion(posts)
      } catch {
        print(error)
      }      
    }
    
    task.resume()
  }
}
