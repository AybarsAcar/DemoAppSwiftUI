//
//  SuccessView.swift
//  DemoApp
//
//  Created by Aybars Acar on 22/4/2022.
//

import SwiftUI

struct SuccessView: View {
  
  @State private var show = false
  
  var body: some View {
    VStack {
      Text("Logging you...")
        .font(.title.bold())
        .opacity(show ? 1 : 0)
        .animation(.linear(duration: 1).delay(0.2), value: show)
      
      LottieView(.success)
        .frame(width: 300, height: 300)
        .opacity(show ? 1 : 0)
        .animation(.linear(duration: 1).delay(0.4), value: show)

    }
    .padding(.top, 30)
    .background(.regularMaterial)
    .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
    .shadow(color: .black.opacity(0.2), radius: 2, x: 0, y: 2)
    .scaleEffect(show ? 1 : 0.5)
    .onAppear {
      withAnimation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0)) {
        show = true
      }
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background(.black.opacity(show ? 0.5 : 0))
    .ignoresSafeArea()
  }
}

struct SuccessView_Previews: PreviewProvider {
  static var previews: some View {
    SuccessView()
  }
}
