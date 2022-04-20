//
//  LoginView.swift
//  DemoApp
//
//  Created by Aybars Acar on 20/4/2022.
//

import SwiftUI

struct LoginView: View {
  var body: some View {
    ZStack(alignment: .top) {
      Color.black
        .ignoresSafeArea()
      
      Color.theme.background2
        .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
        .edgesIgnoringSafeArea(.bottom)
      
      heroSection
    }
  }
}

// MARK: - Components
extension LoginView {
  
  private var heroSection: some View {
    VStack {
      GeometryReader { geo in
        Text("Learn design & code.\nFrom scratch.")
          .font(.system(size: geo.size.width / 10, weight: .bold))
          .foregroundColor(.white)
          .multilineTextAlignment(.center)
      }
      .frame(maxWidth: 375, maxHeight: 100)
      .padding(.horizontal, 16)
      
      Text("80 hours of courses for SwiftUI, React, and design tools")
        .font(.subheadline)
        .frame(width: 250)
        .multilineTextAlignment(.center)
      
      Spacer()
    }
    .padding(.top, 100)
    .frame(maxWidth: .infinity)
    .frame(height: 477)
    .background(
      ZStack {
        Image("Blob")
          .offset(x: -150, y: -200)
          .blendMode(.plusDarker)
        
        Image("Blob")
          .offset(x: -200, y: -250)
          .blendMode(.overlay)
      }
    )
    .background(
      Image("Card3"), alignment: .bottom
    )
    .background(Color.theme.loginBackground)
    .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
  }
}

struct LoginView_Previews: PreviewProvider {
  static var previews: some View {
    LoginView()
  }
}
