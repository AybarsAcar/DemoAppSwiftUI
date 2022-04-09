//
//  BottomCardView.swift
//  DemoApp
//
//  Created by Aybars Acar on 9/4/2022.
//

import SwiftUI

struct BottomCardView: View {
  var body: some View {
    VStack(spacing: 20) {
      
      RoundedRectangle(cornerRadius: 5, style: .continuous)
        .frame(width: 40, height: 6)
        .opacity(0.2)
      
      Text("This certificate is proof that Meng To has achieved the UI Design course with approval from a Design+Code instructor.")
        .multilineTextAlignment(.center)
        .font(.subheadline)
        .lineSpacing(4)
      
      Spacer()
    }
    .padding(.top, 8)
    .padding(.horizontal, 20)
    .frame(maxWidth: .infinity)
    .background(Color.white)
    .cornerRadius(30)
    .shadow(radius: 20)
  }
}

struct BottomCardView_Previews: PreviewProvider {
  static var previews: some View {
    BottomCardView()
  }
}
