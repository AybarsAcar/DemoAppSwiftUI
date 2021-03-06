//
//  RingView.swift
//  DemoApp
//
//  Created by Aybars Acar on 10/4/2022.
//

import SwiftUI

/// Ring progress starts from top centre
struct RingView: View {
  
  let colors: [Color]
  let width: CGFloat
  let height: CGFloat
  let progress: Double
  let delay: Double
  
  let multiplier: CGFloat
  
  @Binding var show: Bool
  
  init(withProgress progress: Double, showProgress show: Binding<Bool>, withDelay delay: Double = 0, colors: [Color], width: CGFloat = 44, height: CGFloat = 44) {
    self.colors = colors
    self.width = width
    self.height = height
    self.progress = progress
    self._show = show
    self.delay = delay
    
    self.multiplier = width / 44
  }
  
  var body: some View {
    ZStack {
      Circle()
        .stroke(.black.opacity(0.1), style: StrokeStyle(lineWidth: 5 * multiplier))
        .frame(width: width, height: height)
      
      Circle()
        .trim(from: show ? 1 - (progress / 100) : 1, to: 1)
        .stroke(
          .linearGradient(colors: colors, startPoint: .topTrailing, endPoint: .bottomLeading),
          style: StrokeStyle(
            lineWidth: 5 * multiplier,
            lineCap: .round,
            lineJoin: .round,
            miterLimit: .infinity,
            dash: [],
            dashPhase: 0
          )
        )
        .animation(.easeInOut.delay(self.delay), value: self.show)
        .rotationEffect(.degrees(90))
        .rotation3DEffect(.degrees(180), axis: (x: 1, y: 0, z: 0))
        .frame(width: width, height: height)
        .shadow(color: .theme.eggplant.opacity(0.1), radius: 3 * multiplier, x: 0, y: 3 * multiplier)
      
      Text("\(Int(progress))%")
        .font(.system(size: 14 * multiplier, weight: .bold))
    }
  }
}

struct RingView_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      RingView(withProgress: 82, showProgress: .constant(true), colors: [.theme.maroon, .theme.eggplant])
      RingView(withProgress: 54, showProgress: .constant(true), colors: [.theme.maroon, .theme.eggplant], width: 120, height: 120)
    }
    .previewLayout(.sizeThatFits)
    .padding()
  }
}
