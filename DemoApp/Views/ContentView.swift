//
//  ContentView.swift
//  DemoApp
//
//  Created by Aybars Acar on 9/4/2022.
//

import SwiftUI

struct ContentView: View {
  
  @State private var show = false
  @State private var viewState: CGSize = .zero
  @State private var showCard = false
  @State private var bottomState: CGSize = .zero
  @State private var showFull = false
  
  var body: some View {
    
    ZStack {
      
      TitleView()
        .blur(radius: show ? 20 : 0)
        .opacity(showCard ? 0.4 : 1)
        .offset(y: showCard ? -200 : 0)
        .animation(.default.delay(0.1), value: showCard)
      
      BackcardView()
        .frame(width: showCard ? 300 : 340, height: 220)
        .background(show ? Color.theme.card3 : Color.theme.card4)
        .cornerRadius(20)
        .shadow(radius: 20)
        .offset(x: 0, y: show ? -400 : -40)
        .offset(x: viewState.width, y: viewState.height)
        .offset(y: showCard ? -280 : 0)
        .scaleEffect(showCard ? 1 : 0.9)
        .rotationEffect(.degrees(show ? 0 : 10))
        .rotationEffect(.degrees(showCard ? -10 : 0))
        .rotation3DEffect(.degrees(showCard ? 0 : 10), axis: (x: 10, y: 0, z: 0))
        .blendMode(.hardLight)
        .animation(.easeInOut(duration: 0.5), value: show)
      
      BackcardView()
        .frame(width: 340, height: 220)
        .background(show ? Color.theme.card4 : Color.theme.card3)
        .cornerRadius(20)
        .shadow(radius: 20)
        .offset(x: 0, y: show ? -200 : -20)
        .offset(x: viewState.width, y: viewState.height)
        .offset(y: showCard ? -220 : 0)
        .scaleEffect(showCard ? 1 : 0.95)
        .rotationEffect(.degrees(show ? 0 : 5))
        .rotationEffect(.degrees(showCard ? -5 : 0))
        .rotation3DEffect(.degrees(showCard ? 0 : 5), axis: (x: 10, y: 0, z: 0))
        .blendMode(.hardLight)
      
      CardView()
        .frame(width: showCard ? 375 : 340, height: 220)
        .background(Color.black)
        .clipShape(RoundedRectangle(cornerRadius: showCard ? 30 : 20, style: .continuous))
        .shadow(radius: 20)
        .offset(x: viewState.width, y: viewState.height)
        .offset(y: showCard ? -170 : 0)
        .blendMode(.hardLight)
        .onTapGesture {
          withAnimation(.easeInOut(duration: 0.3)) {
            showCard.toggle()
          }
        }
        .gesture(
          DragGesture()
            .onChanged { value in
              // store the drag values in teh viewstate
              viewState = value.translation
              show = true
            }
            .onEnded { value in
              withAnimation(.spring(response: 0.3, dampingFraction: 0.6, blendDuration: 0)) {
                viewState = .zero
                show = false
              }
            }
        )
      
      BottomCardView(show: $showCard)
        .offset(x: 0, y: showCard ? 360 : 1000)
        .offset(y: bottomState.height)
        .blur(radius: show ? 20 : 0)
        .animation(.timingCurve(0.2, 0.8, 0.2, 1, duration: 0.8), value: showCard)
        .gesture(
          DragGesture()
            .onChanged { value in
              bottomState = value.translation
              if showFull {
                bottomState.height += -300
              }
              
              if bottomState.height < -300 {
                bottomState.height = -300
              }
            }
            .onEnded { value in
              withAnimation {
                if bottomState.height > 50 {
                  showCard = false
                }
                
                if (bottomState.height < -100 && !showFull) || (bottomState.height < -250 && showFull) {
                  bottomState.height = -300
                  showFull = true
                }
                
                else {
                  bottomState = .zero
                  showFull = false
                }
              }
            }
        )
      
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
