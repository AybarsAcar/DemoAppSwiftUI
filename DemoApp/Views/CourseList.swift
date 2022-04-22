//
//  CourseList.swift
//  DemoApp
//
//  Created by Aybars Acar on 10/4/2022.
//

import SwiftUI

struct CourseList: View {
  
  @Environment(\.horizontalSizeClass) private var horizontalSizeClass
  
  @ObservedObject private var viewModel = CourseStoreViewModel()
  
  @State private var active = false
  @State private var activeIndex = -1
  @State private var activeView: CGSize = .zero
  
  var body: some View {
    GeometryReader { geo in
      ZStack {
        
        Color.black.opacity(activeView.height / 500)
          .ignoresSafeArea()
        
        ScrollView {
          VStack(spacing: 30) {
            
            Text("Courses")
              .font(.largeTitle.bold())
              .frame(maxWidth: .infinity, alignment: .leading)
              .padding(.horizontal, 30)
              .padding(.top, 30)
              .blur(radius: active ? 20 : 0)
            
            ForEach(viewModel.courses.indices, id: \.self) { index in
              GeometryReader { geo in
                CourseView(course: viewModel.courses[index], show: $viewModel.courses[index].show, active: $active, index: index, activeIndex: $activeIndex, activeView: $activeView)
                  .offset(y: viewModel.courses[index].show ? -geo.frame(in: .global).minY : 0)
                  .opacity(activeIndex != index && active ? 0 : 1)
                  .scaleEffect(activeIndex != index && active ? 0.5 : 1)
                  .offset(x: activeIndex != index && active ? geo.size.width : 0)
              }
              .frame(height: horizontalSizeClass == .regular ? 80 : 280)
              .frame(maxWidth: viewModel.courses[index].show ? 712 : getCardWidth(proxy: geo))
              .zIndex(viewModel.courses[index].show ? 1 : 0)
            }
          }
          .frame(width: geo.size.width)
        }
        .statusBar(hidden: active)
      }
    }
  }
}

extension CourseList {
  
  private func getCardWidth(proxy: GeometryProxy) -> CGFloat {
    
    if proxy.size.width > 712 {
      return 712
    }
    
    return proxy.size.width - 60
  }
}

struct CourseList_Previews: PreviewProvider {
  static var previews: some View {
    CourseList()
  }
}

