//
//  TabBar.swift
//  DemoApp
//
//  Created by Aybars Acar on 10/4/2022.
//

import SwiftUI

struct TabBar: View {
  var body: some View {
    TabView {
      Home()
        .tabItem {
          Image(systemName: "play.circle.fill")
          Text("Home")
        }
      
      ContentView()
        .tabItem {
          Image(systemName: "rectangle.stack.fill")
          Text("Certificatss")
        }
    }
  }
}

struct TabBar_Previews: PreviewProvider {
  static var previews: some View {
    TabBar()
  }
}
