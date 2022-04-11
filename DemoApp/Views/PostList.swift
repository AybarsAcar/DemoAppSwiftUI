//
//  PostList.swift
//  DemoApp
//
//  Created by Aybars Acar on 11/4/2022.
//

import SwiftUI

struct PostList: View {
  
  @State private var posts = [Post]()
  
  var body: some View {
    List(posts) { post in
      Text(post.title)
    }
    .onAppear {
      APIService.shared.getPosts { posts in
        DispatchQueue.main.async {
          self.posts = posts
        }
      }
    }
  }
}

struct PostList_Previews: PreviewProvider {
  static var previews: some View {
    PostList()
  }
}
