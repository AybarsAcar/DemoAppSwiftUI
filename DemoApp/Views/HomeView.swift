//
//  HomeView.swift
//  DemoApp
//
//  Created by Aybars Acar on 9/4/2022.
//

import SwiftUI

struct HomeView: View {
  
  @Binding var showProfile: Bool
  
  @State private var showUpdate = false
  
  var body: some View {
    VStack {
      HStack {
        Text("Watching")
          .font(.system(size: 28, weight: .bold))
        
        Spacer()
        
        AvatarView(showProfile: $showProfile)
         
        Button {
          showUpdate.toggle()
        } label: {
          Image(systemName: "bell")
            .foregroundColor(.primary)
            .font(.system(size: 16, weight: .medium))
            .frame(width: 36, height: 36)
            .background(Color.white)
            .clipShape(Circle())
            .shadow(color: .black.opacity(0.1), radius: 1, x: 0, y: 1)
            .shadow(color: .black.opacity(0.2), radius: 10, x: 0, y: 10)
        }
        .sheet(isPresented: $showUpdate) {
          UpdateList()
        }

      }
      .padding(.horizontal)
      .padding(.leading, 14)
      .padding(.top, 30)
      
      ScrollView(.horizontal, showsIndicators: false) {
        HStack(spacing: 20) {
          ForEach(Section.mockData) { item in
            GeometryReader { geo in
              
              let minX = geo.frame(in: .global).minX
              
              SectionView(section: item)
                .rotation3DEffect(.degrees(-(minX - 30) / 40), axis: (x: 0, y: 1, z: 0))
            }
            .frame(width: 275, height: 275)
          }
        }
        .padding(30)
        .padding(.bottom, 30)
      }
      
      Spacer()
      
    }
  }
}

struct HomeView_Previews: PreviewProvider {
  static var previews: some View {
    HomeView(showProfile: .constant(true))
  }
}

