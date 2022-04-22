//
//  MenuView.swift
//  DemoApp
//
//  Created by Aybars Acar on 9/4/2022.
//

import SwiftUI

struct MenuView: View {
  
  @EnvironmentObject private var userStore: UserStore
  
  @Binding var showProfile: Bool
  
  var body: some View {
    VStack {
      Spacer()
      
      VStack(spacing: 16) {
        
        Text("Meng - 28% complete")
          .font(.caption)
        
        Color.white
          .frame(width: 38, height: 6)
          .cornerRadius(3)
          .frame(width: 130, height: 6, alignment: .leading)
          .background(Color.black.opacity(0.08))
          .cornerRadius(3)
          .padding()
          .frame(width: 150, height: 24)
          .background(Color.black.opacity(0.1))
          .cornerRadius(12)
        
        MenuRow("Account", systemIcon: "gear")
        MenuRow("Billing", systemIcon: "creditcard")
        MenuRow("Sign out", systemIcon: "person.crop.circle")
          .onTapGesture {
            UserDefaults.standard.set(false, forKey: "isLoggedIn")
            userStore.isLoggedIn = false
            showProfile = false
          }
      }
      .frame(maxWidth: .infinity)
      .frame(height: 300)
      .background(BlurView(withStyle: .systemThickMaterial))
      .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
      .shadow(color: .black.opacity(0.2), radius: 20, x: 0, y: 20)
      .padding(.horizontal, 30)
      .overlay {
        Image("Avatar")
          .resizable()
          .scaledToFill()
          .frame(width: 60, height: 60)
          .clipShape(Circle())
          .offset(y: -150)
        }
    }
    .padding(.bottom, 30)
  }
}

struct MenuView_Previews: PreviewProvider {
  static var previews: some View {
    MenuView(showProfile: .constant(true))
      .environmentObject(UserStore())
  }
}

struct MenuRow: View {
  
  let title: String
  let systemIcon: String
  
  init(_ title: String, systemIcon: String) {
    self.title = title
    self.systemIcon = systemIcon
  }
  
  var body: some View {
    HStack(spacing: 16) {
      Image(systemName: systemIcon)
        .font(.system(size: 20, weight: .light, design: .default))
        .imageScale(.large)
        .frame(width: 32, height: 32)
        .foregroundColor(.theme.blueGray)
      
      Text(title)
        .font(.system(size: 20, weight: .bold, design: .default))
        .frame(width: 120, alignment: .leading)
    }
  }
}
