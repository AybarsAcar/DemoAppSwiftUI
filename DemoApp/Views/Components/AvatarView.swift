//
//  AvatarView.swift
//  DemoApp
//
//  Created by Aybars Acar on 9/4/2022.
//

import SwiftUI

struct AvatarView: View {
  
  @Binding var showProfile: Bool
  
  var body: some View {
    Button {
      withAnimation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0)) {
        showProfile.toggle()
      }
    } label: {
      Image("Avatar")
        .renderingMode(.original)
        .resizable()
        .frame(width: 36, height: 36)
        .clipShape(Circle())
    }
  }
}

struct AvatarView_Previews: PreviewProvider {
  static var previews: some View {
    AvatarView(showProfile: .constant(true))
  }
}
