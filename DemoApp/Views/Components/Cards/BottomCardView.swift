//
//  BottomCardView.swift
//  DemoApp
//
//  Created by Aybars Acar on 9/4/2022.
//

import SwiftUI

struct BottomCardView: View {
  
  @Binding var show: Bool
  
  var body: some View {
    VStack(spacing: 20) {
      
      RoundedRectangle(cornerRadius: 5, style: .continuous)
        .frame(width: 40, height: 6)
        .opacity(0.2)
      
      Text("This certificate is proof that Meng To has achieved the UI Design course with approval from a Design+Code instructor.")
        .multilineTextAlignment(.center)
        .font(.subheadline)
        .lineSpacing(4)
      
      HStack(spacing: 20) {
        RingView(
          withProgress: 78,
          showProgress: $show,
          withDelay: 0.3,
          colors: [.theme.lightBlue, .theme.darkBlue],
          width: 88,
          height: 88
        )
        
        VStack(alignment: .leading, spacing: 8) {
          Text("SwiftUI")
            .fontWeight(.bold)
          
          Text("12 of 12 sections completed\n10 hours spent so far")
            .font(.footnote)
            .foregroundColor(.secondary)
            .lineSpacing(4)
        }
        .padding(20)
        .background(.white)
        .cornerRadius(20)
        .shadow(color: .black.opacity(0.2), radius: 20, x: 0, y: 10)
      }
      
      Spacer()
    }
    .padding(.top, 8)
    .padding(.horizontal, 20)
    .frame(maxWidth: .infinity)
    .background(BlurView(withStyle: .systemThinMaterial))
    .cornerRadius(30)
    .shadow(radius: 20)
  }
}

struct BottomCardView_Previews: PreviewProvider {
  static var previews: some View {
    BottomCardView(show: .constant(true))
  }
}
