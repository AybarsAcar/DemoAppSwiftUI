//
//  LoadingView.swift
//  DemoApp
//
//  Created by Aybars Acar on 21/4/2022.
//

import SwiftUI

struct LoadingView: View {
  var body: some View {
    VStack {
      LottieView(.loading)
        .frame(width: 200, height: 200)
    }
  }
}

struct LoadingView_Previews: PreviewProvider {
  static var previews: some View {
    LoadingView()
  }
}
