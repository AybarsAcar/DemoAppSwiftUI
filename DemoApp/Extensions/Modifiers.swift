//
//  Modifiers.swift
//  DemoApp
//
//  Created by Aybars Acar on 10/4/2022.
//

import SwiftUI

struct ShadowModifier: ViewModifier {
  func body(content: Content) -> some View {
    content
      .shadow(color: .black.opacity(0.2), radius: 10, x: 0, y: 12)
      .shadow(color: .black.opacity(0.1), radius: 1, x: 0, y: 1)
  }
}

struct FontModifier: ViewModifier {
  
  let style: Font.TextStyle
  
  func body(content: Content) -> some View {
    content
      .font(.system(style, design: .default))
  }
}

struct CustomFontModifier: ViewModifier {
  func body(content: Content) -> some View {
    content
      .font(.custom("WorkSans-Bold", size: 28))
  }
}

extension View {
  var doubleDropShadow: some View {
    self
      .modifier(ShadowModifier())
  }
  
  func withCustomFont(style: Font.TextStyle = .body) -> some View {
    modifier(FontModifier(style: style))
  }
  
  func workSansBold() -> some View {
    modifier(CustomFontModifier())
  }
}
