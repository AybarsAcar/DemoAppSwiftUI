//
//  CourseList.swift
//  DemoApp
//
//  Created by Aybars Acar on 10/4/2022.
//

import SwiftUI

struct CourseList: View {
  
  @State private var courses = Course.mockData
  @State private var active = false
  @State private var activeIndex = -1
  
  var body: some View {
    ZStack {
      
      Color.black.opacity(active ? 0.5 : 0)
        .ignoresSafeArea()
      
      ScrollView {
        VStack(spacing: 30) {
          
          Text("Courses")
            .font(.largeTitle.bold())
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 30)
            .padding(.top, 30)
            .blur(radius: active ? 20 : 0)
          
          ForEach(Course.mockData.indices, id: \.self) { index in
            GeometryReader { geo in
              CourseView(course: courses[index], show: $courses[index].show, active: $active, index: index, activeIndex: $activeIndex)
                .offset(y: courses[index].show ? -geo.frame(in: .global).minY : 0)
                .opacity(activeIndex != index && active ? 0 : 1)
                .scaleEffect(activeIndex != index && active ? 0.5 : 1)
                .offset(x: activeIndex != index && active ? UIScreen.screenWidth : 0)
            }
            .frame(height: 280)
            .frame(maxWidth: courses[index].show ? .infinity : UIScreen.screenWidth - 60)
            .zIndex(courses[index].show ? 1 : 0)
          }
        }
        .frame(width: UIScreen.screenWidth)
      }
      .statusBar(hidden: active)
    }
  }
}

struct CourseList_Previews: PreviewProvider {
  static var previews: some View {
    CourseList()
  }
}

