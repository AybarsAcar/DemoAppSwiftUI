//
//  HomeView.swift
//  DemoApp
//
//  Created by Aybars Acar on 9/4/2022.
//

import SwiftUI

struct HomeView: View {
  
  @Binding var showProfile: Bool
  @Binding var showContent: Bool
  
  @State private var showUpdate = false
  
  var body: some View {
    ScrollView(.vertical, showsIndicators: false) {
      VStack {
        HStack {
          Text("Watching")
            .font(.workSansBold(size: 28))
          
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
          watchRings
            .padding(.horizontal, 30)
            .padding(.bottom, 30)
            .onTapGesture {
              withAnimation(.spring(response: 0.6, dampingFraction: 0.8, blendDuration: 0)) {
                showContent = true
              }
            }
        }
        
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
        .offset(y: -30)
        
        Text("Courses")
          .font(.title.bold())
          .frame(maxWidth: .infinity, alignment: .leading)
          .padding(.leading, 30)
          .offset(y: -60)
        
        ForEach(Section.mockData) { item in
          SectionView(section: item, width: UIScreen.screenWidth - 60, height: 275)
        }
        .offset(y: -60)
        
        Spacer()
        
      }
    }
  }
}

extension HomeView {
  
  private var watchRings: some View {
    HStack(spacing: 30) {
      HStack(spacing: 12) {
        RingView(withProgress: 68, showProgress: .constant(true), colors: [.theme.eggplant, .theme.lightBlue])
        
        VStack(alignment: .leading, spacing: 4) {
          Text("6 minutes left")
            .bold()
            .withCustomFont(style: .subheadline)
          
          Text("Watched 10 mins today")
            .withCustomFont(style: .caption)
        }
      }
      .padding(8)
      .background(.white)
      .cornerRadius(20)
      .doubleDropShadow
      
      HStack(spacing: 12) {
        RingView(withProgress: 54, showProgress: .constant(true), colors: [.theme.maroon, .red], width: 32, height: 32)
      }
      .padding(8)
      .background(.white)
      .cornerRadius(20)
      .doubleDropShadow
      
      HStack(spacing: 12) {
        RingView(withProgress: 32, showProgress: .constant(true), colors: [.theme.lightBlue, .theme.eggplant], width: 32, height: 32)
      }
      .padding(8)
      .background(.white)
      .cornerRadius(20)
      .doubleDropShadow
    }
  }
}

struct HomeView_Previews: PreviewProvider {
  static var previews: some View {
    HomeView(showProfile: .constant(true), showContent: .constant(false))
  }
}

