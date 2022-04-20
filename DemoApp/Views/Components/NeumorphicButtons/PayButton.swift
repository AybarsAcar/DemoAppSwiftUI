//
//  PayButton.swift
//  DemoApp
//
//  Created by Aybars Acar on 20/4/2022.
//

import SwiftUI

struct PayButton: View {
  
  @GestureState private var tapped = false
  @State private var longPressed = false
  
  var body: some View {
    
    ZStack {
      Image("fingerprint")
        .opacity(longPressed ? 0 : 1)
        .scaleEffect(longPressed ? 0 : 1)
      
      Image("fingerprint-2")
        .clipShape(
          Rectangle() // for masking
            .offset(y: tapped ? 0 : 50)
        )
        .opacity(longPressed ? 0 : 1)
        .scaleEffect(longPressed ? 0 : 1)
      
      Image(systemName: "checkmark.circle.fill")
        .font(.system(size: 44, weight: .light))
        .foregroundColor(Color(#colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1)))
        .opacity(longPressed ? 1 : 0)
        .scaleEffect(longPressed ? 1 : 0)
    }
    .frame(width: 120, height: 120)
    .background(
      ZStack {
        LinearGradient(gradient: Gradient(colors: [Color(longPressed ? #colorLiteral(red: 0.9019607843, green: 0.9294117647, blue: 0.9882352941, alpha: 1) : #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)), Color(longPressed ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) : #colorLiteral(red: 0.9019607843, green: 0.9294117647, blue: 0.9882352941, alpha: 1))]), startPoint: .topLeading, endPoint: .bottomTrailing)
        
        // inner shadows
        Circle()
          .stroke(.black.opacity(0.0000001), lineWidth: 10)
          .shadow(color: Color(#colorLiteral(red: 0.7256438732, green: 0.7787529826, blue: 0.8831245303, alpha: 1)), radius: longPressed ? 10 : 3, x: longPressed ? 5 : -5, y: longPressed ? 5 : -5)
        
        Circle()
          .stroke(.black.opacity(0.0000001), lineWidth: 10)
          .shadow(color: Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)), radius: 3, x: longPressed ? -3 : 3, y: longPressed ? -3 : 3)
        
      }
    )
    .clipShape(Circle())
    .overlay(
      // progress animation
      Circle()
        .trim(from: tapped ? 0 : 1, to: 1)
        .stroke(
          LinearGradient(gradient: Gradient(colors: [Color(longPressed ? #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1) : #colorLiteral(red: 0.4196078431, green: 0.2980392157, blue: 0.9490196078, alpha: 1)), Color(longPressed ? #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1) : #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1))]), startPoint: .topTrailing, endPoint: .bottomLeading),
          style: StrokeStyle(lineWidth: 5, lineCap: .round)
        )
        .frame(width: 88, height: 88)
        .rotationEffect(.degrees(90))
        .rotation3DEffect(.degrees(180), axis: (1, 0, 0))
        .shadow(color: Color(longPressed ? #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1) : #colorLiteral(red: 0.4196078431, green: 0.2980392157, blue: 0.9490196078, alpha: 1)).opacity(0.3), radius: 5, x: 3, y: 3)
      
    )
    .shadow(color: .white, radius: 20, x: -20, y: -20)
    .shadow(color: Color(#colorLiteral(red: 0.7294117647, green: 0.7843137255, blue: 0.8941176471, alpha: 1)), radius: 20, x: 20, y: 20)
    .scaleEffect(tapped ? 1.2 : 1)
    .gesture(
      LongPressGesture()
        .updating($tapped) { currentState, gestureState, transaction in
          gestureState = currentState
        }
        .onEnded { value in
          longPressed.toggle()
        }
    )
    .animation(.easeInOut, value: tapped)
  }
}

struct PayButton_Previews: PreviewProvider {
  static var previews: some View {
    VStack {
      PayButton()
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background(Color(#colorLiteral(red: 0.8980392157, green: 0.9333333333, blue: 1, alpha: 1)))
    .edgesIgnoringSafeArea(.all)
  }
}
