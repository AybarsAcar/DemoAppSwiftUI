//
//  AvatarView.swift
//  DemoApp
//
//  Created by Aybars Acar on 9/4/2022.
//

import SwiftUI

struct AvatarView: View {
  
  @EnvironmentObject private var userStore: UserStore
  
  @Binding var showProfile: Bool
  
  var body: some View {
    VStack {
      if userStore.isLoggedIn {
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
      } else {
        Button {
          userStore.showLogin.toggle()
        } label: {
          Image(systemName: "person")
            .foregroundColor(.primary)
            .font(.system(size: 16, weight: .medium))
            .frame(width: 36, height: 36)
            .background(Color.theme.background3)
            .clipShape(Circle())
            .shadow(color: .black.opacity(0.1), radius: 1, x: 0, y: 1)
            .shadow(color: .black.opacity(0.2), radius: 10, x: 0, y: 10)
        }
        
      }
    }
  }
}

struct AvatarView_Previews: PreviewProvider {
  static var previews: some View {
    AvatarView(showProfile: .constant(true))
      .environmentObject(UserStore())
  }
}
