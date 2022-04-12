//
//  PostList.swift
//  DemoApp
//
//  Created by Aybars Acar on 11/4/2022.
//

import SwiftUI

struct PostList: View {
  
  @ObservedObject private var viewModel = DateStore()
  
  var body: some View {
    List(viewModel.post) { post in
      VStack(alignment: .leading, spacing: 8) {
        Text(post.title)
          .font(.system(.title, design: .serif).bold())
        
        Text(post.body)
          .font(.subheadline)
          .foregroundColor(.secondary)
      }
    }
    .refreshable {
      viewModel.getPosts()
    }
  }
}

struct PostList_Previews: PreviewProvider {
  static var previews: some View {
    PostList()
  }
}
