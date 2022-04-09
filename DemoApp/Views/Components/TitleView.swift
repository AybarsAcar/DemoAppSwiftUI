//
//  TitleView.swift
//  DemoApp
//
//  Created by Aybars Acar on 9/4/2022.
//

import SwiftUI

struct TitleView: View {
  var body: some View {
    VStack {
      HStack {
        Text("Certificates")
          .font(.largeTitle)
          .fontWeight(.bold)
        Spacer()
      }
      .padding()
      
      Image("Background1")
      
      Spacer()
    }
  }
}

struct TitleView_Previews: PreviewProvider {
  static var previews: some View {
    TitleView()
  }
}
