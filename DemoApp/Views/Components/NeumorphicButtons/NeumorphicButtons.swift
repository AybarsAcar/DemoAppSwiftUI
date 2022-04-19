//
//  NeumorphicButtons.swift
//  DemoApp
//
//  Created by Aybars Acar on 19/4/2022.
//

import SwiftUI

struct NeumorphicButtons: View {
  
  @State private var tapped = false
  @State private var longPressed = false
  
  var body: some View {
    VStack {
      Text("Button")
        .font(.system(size: 20, weight: .semibold, design: .rounded))
        .frame(width: 200, height: 60)
        .background(
          ZStack {
            Color(longPressed ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) : #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))

            
            // for the inner shadow
            RoundedRectangle(cornerRadius: 16, style: .continuous)
              .foregroundColor(Color(longPressed ? #colorLiteral(red: 0.7350739837, green: 0.8465071321, blue: 0.9345290065, alpha: 0.9990234375) : #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
              .blur(radius: 4)
              .offset(x: -8, y: -8)
            
            // for the inner shadow
            RoundedRectangle(cornerRadius: 16, style: .continuous)
              .fill(.linearGradient(Gradient(colors: [Color(#colorLiteral(red: 0.9019607843, green: 0.9294117647, blue: 0.9882352941, alpha: 1)), Color.white]), startPoint: .topLeading, endPoint: .bottomTrailing))
              .foregroundColor(Color(#colorLiteral(red: 0.7608050108, green: 0.8164883852, blue: 0.9259157777, alpha: 1)))
              .padding(2)
              .blur(radius: 2)
            
          }
        )
        .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
        .overlay(
          HStack {
            Image(systemName: "person.crop.circle")
              .font(.system(size: 24, weight: .light))
              .foregroundColor(Color.white.opacity(longPressed ? 0 : 1))
              .frame(width: longPressed ? 64 : 54, height: longPressed ? 4 :50)
              .background(Color(#colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)))
              .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
              .shadow(color: Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)).opacity(0.3), radius: 10, x: 10, y: 10)
              .offset(x: longPressed ? 70 : -10, y: longPressed ? 16 : 0)
              .animation(.spring(response: 0.5, dampingFraction: 0.7, blendDuration: 0), value: longPressed)
            
            Spacer()
          }
        )
        .shadow(color: longPressed ? Color(#colorLiteral(red: 0.7450980392, green: 0.8, blue: 0.8980392157, alpha: 1)) : Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)), radius: 20, x: -20, y: -20)
        .shadow(color: longPressed ? Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)) : Color(#colorLiteral(red: 0.7294117647, green: 0.7843137255, blue: 0.8941176471, alpha: 1)), radius: 20, x: 20, y: 20)
        .scaleEffect(tapped ? 1.2 : 1)
        .gesture(
          LongPressGesture(minimumDuration: 0.5, maximumDistance: 10)
            .onChanged { value in
              withAnimation(.spring(response: 0.5, dampingFraction: 0.5, blendDuration: 0)) {
                tapped = true
              }
              
              DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                withAnimation(.spring(response: 0.5, dampingFraction: 0.5, blendDuration: 0)) {
                  tapped = false
                }
              }
            }
            .onEnded { value in
              longPressed.toggle()
            }
        )
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background(Color(#colorLiteral(red: 0.8980392157, green: 0.9333333333, blue: 1, alpha: 1)))
    .edgesIgnoringSafeArea(.all)
  }
}

struct NeumorphicButtons_Previews: PreviewProvider {
  static var previews: some View {
    NeumorphicButtons()
  }
}
