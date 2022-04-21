//
//  LoginView.swift
//  DemoApp
//
//  Created by Aybars Acar on 20/4/2022.
//

import SwiftUI

struct LoginView: View {
  
  // hero animation states
  @State private var show = false
  @State private var viewState: CGSize = .zero
  @State private var isDragging = false
  
  // login form states
  @State private var email = ""
  @State private var password = ""
  
  var body: some View {
    ZStack(alignment: .top) {
      Color.black
        .ignoresSafeArea()
      
      Color.theme.background2
        .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
        .edgesIgnoringSafeArea(.bottom)
      
      heroSection
      
      formSection
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
      .offset(x: viewState.width / 15, y: viewState.height / 15)
      
      Text("80 hours of courses for SwiftUI, React, and design tools")
        .font(.subheadline)
        .frame(width: 250)
        .multilineTextAlignment(.center)
        .offset(x: viewState.width / 20, y: viewState.height / 20)

      Spacer()
    }
    .padding(.top, 100)
    .frame(maxWidth: .infinity)
    .frame(height: 477)
    .background(
      ZStack {
        Image("Blob")
          .offset(x: -150, y: -200)
          .rotationEffect(.degrees(show ? 360 + 90 : 90))
          .blendMode(.plusDarker)
          .animation(.linear(duration: 120).repeatForever(autoreverses: false), value: show)
          .onAppear {
            show = true
          }
        
        Image("Blob")
          .offset(x: -200, y: -250)
          .rotationEffect(.degrees(show ? 360 : 0), anchor: .leading)
          .blendMode(.overlay)
          .animation(.linear(duration: 100).repeatForever(autoreverses: false), value: show)

      }
    )
    .background(
      Image("Card3")
        .offset(x: viewState.width / 25, y: viewState.height / 25)
      , alignment: .bottom
    )
    .background(Color.theme.loginBackground)
    .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
    .scaleEffect(isDragging ? 0.9 : 1)
    .animation(.timingCurve(0.2, 0.8, 0.2, 1, duration: 0.8), value: isDragging)
    .rotation3DEffect(.degrees(5), axis: (viewState.width, viewState.height, 0))
    .gesture(
      DragGesture()
        .onChanged { value in
          viewState = value.translation
          isDragging = true
        }
        .onEnded { value in
          viewState = .zero
          isDragging = false
        }
    )
  }
  
  private var formSection: some View {
    VStack {
      HStack {
        Image(systemName: "person.crop.circle.fill")
          .foregroundColor(.theme.loginBackground)
          .frame(width: 44, height: 44)
          .background(.white)
          .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
          .shadow(color: .black.opacity(0.15), radius: 5, x: 0, y: 5)
        
        TextField("Your Email".uppercased(), text: $email)
          .keyboardType(.emailAddress)
          .font(.subheadline)
          .padding(.leading)
          .frame(height: 44)
      }
      .padding(.leading)
      
      Divider()
        .padding(.horizontal, 80)
      
      HStack {
        Image(systemName: "lock.fill")
          .foregroundColor(.theme.loginBackground)
          .frame(width: 44, height: 44)
          .background(.white)
          .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
          .shadow(color: .black.opacity(0.15), radius: 5, x: 0, y: 5)
        
        SecureField("Password".uppercased(), text: $password)
          .font(.subheadline)
          .padding(.leading)
          .frame(height: 44)
      }
      .padding(.leading)
    }
    .frame(height: 136)
    .frame(maxWidth: .infinity)
    .background(BlurView(withStyle: .systemChromeMaterial))
    .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
    .shadow(color: .black.opacity(0.4), radius: 20, x: 0, y: 20)
    .padding(.horizontal)
    .offset(y: 460)
  }
}

struct LoginView_Previews: PreviewProvider {
  static var previews: some View {
    LoginView()
  }
}
