//
//  Home.swift
//  DemoApp
//
//  Created by Aybars Acar on 9/4/2022.
//

import SwiftUI

struct Home: View {
  
  @State private var showProfile = false
  @State private var showContent = false
  @State private var viewState: CGSize = .zero
  
  var body: some View {
  
    ZStack {
      
      Color.theme.background2
        .ignoresSafeArea()
      
      HomeView(showProfile: $showProfile, showContent: $showContent)
        .padding(.top, 44)
        .background(
          .linearGradient(colors: [.theme.background2, .theme.background1], startPoint: .top, endPoint: .bottom)
        )
        .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
        .shadow(color: .black.opacity(0.2), radius: 20, x: 0, y: 20)
        .offset(y: showProfile ? -450 + (viewState.height / 2) : 0)
        .rotation3DEffect(.degrees(showProfile ? Double(viewState.height / 20) - 10 : 0), axis: (x: 10, y: 0, z: 0))
        .scaleEffect(showProfile ? 0.9 : 1)
        .ignoresSafeArea()
      
      MenuView()
        .background(Color.black.opacity(0.001))
        .offset(y: showProfile ? 0 : UIScreen.screenHeight)
        .offset(y: viewState.height)
        .onTapGesture {
          withAnimation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0)) {
            showProfile.toggle()
          }
        }
        .gesture(
          DragGesture()
            .onChanged { value in
              viewState = value.translation
            }
            .onEnded { value in
              withAnimation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0)) {
                if self.viewState.height > 150 {
                  showProfile = false
                }
                viewState = .zero
                
              }
            }
        )
      
      if showContent {
        ZStack(alignment: .topTrailing) {
          BlurView(withStyle: .systemMaterial)
            .ignoresSafeArea()
          
          ContentView()
          
          Image(systemName: "xmark")
            .frame(width: 36, height: 36)
            .foregroundColor(.white)
            .background(.black)
            .clipShape(Circle())
            .padding(.horizontal)
            .onTapGesture {
              withAnimation(.spring(response: 0.6, dampingFraction: 0.8, blendDuration: 0)) {
                showContent = false
              }
            }
        }
        .transition(.move(edge: .bottom))
      }
    }
  }
}

struct Home_Previews: PreviewProvider {
  static var previews: some View {
    Home()
  }
}
