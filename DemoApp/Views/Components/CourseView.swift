//
//  CourseView.swift
//  DemoApp
//
//  Created by Aybars Acar on 10/4/2022.
//

import SwiftUI
import SDWebImageSwiftUI

struct CourseView: View {
  
  let course: Course
  @Binding var show: Bool
  @Binding var active: Bool
  let index: Int
  @Binding var activeIndex: Int
  
  @Binding var activeView: CGSize
  
  var body: some View {
    ZStack(alignment: .top) {
      
      VStack(alignment: .leading, spacing: 30) {
        Text("Take your SwiftUI app to the App Store with advanced techniques like API data, packages and CMS.")
        
        Text("About this course")
          .font(.title).bold()
        
        Text("This course is unlike any other. We care about design and want to make sure that you get better at it in the process. It was written for designers and developers who are passionate about collaborating and building real apps for iOS and macOS. While it's not one codebase for all apps, you learn once and can apply the techniques and controls to all platforms with incredible quality, consistency and performance. It's beginner-friendly, but it's also packed with design tricks and efficient workflows for building great user interfaces and interactions.")
        
        Text("Minimal coding experience required, such as in HTML and CSS. Please note that Xcode 11 and Catalina are essential. Once you get everything installed, it'll get a lot friendlier! I added a bunch of troubleshoots at the end of this page to help you navigate the issues you might encounter.")
      }
      .padding(30)
      .frame(maxWidth: show ? .infinity : UIScreen.screenWidth - 60, maxHeight: show ? .infinity : 280, alignment: .top)
      .offset(y: show ? 460 : 0)
      .background(.white)
      .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
      .shadow(color: .black.opacity(0.2), radius: 20, x: 0, y: 20)
      .opacity(show ? 1 : 0)
      
      VStack {
        
        HStack(alignment: .top) {
          VStack(alignment: .leading, spacing: 8) {
            Text(course.title)
              .font(.system(size: 24, weight: .bold))
              .foregroundColor(.white)
            
            Text(course.subtitle)
              .foregroundColor(.white.opacity(0.7))
          }
          
          Spacer()
          
          ZStack {
            Image(uiImage: course.logo)
              .opacity(show ? 0 : 1)
            
            VStack {
              Image(systemName: "xmark")
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(.white)
            }
            .frame(width: 36, height: 36)
            .background(.black)
            .clipShape(Circle())
            .opacity(show ? 1 : 0)
          }
        }
        
        Spacer()
        
        WebImage(url: course.image)
          .resizable()
          .scaledToFit()
          .frame(maxWidth: .infinity)
          .frame(height: 140, alignment: .top)
      }
      .padding(show ? 30 : 20)
      .padding(.top, show ? 30 : 0)
      .frame(maxWidth: show ? .infinity : UIScreen.screenWidth - 60, maxHeight: show ? 460 : 280)
      .background(Color(course.color))
      .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
      .shadow(color: Color(course.color).opacity(0.3), radius: 20, x: 0, y: 20)
      .gesture( show ?
                DragGesture()
        .onChanged { value in
          if value.translation.height < 300 && value.translation.height > 0 {
            activeView = value.translation
          }
        }
        .onEnded { value in
          if activeView.height > 50 {
            show = false
            active = false
            activeIndex = -1
          }
          
          activeView = .zero
        }
                : nil
      )
      .onTapGesture {
        withAnimation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0)) {
          show.toggle()
          active.toggle()
          
          if show {
            activeIndex = index
          }
          else {
            activeIndex = -1
          }
        }
      }
      
      if show {
        CourseDetail(course: course, show: $show, active: $active, activeIndex: $activeIndex)
          .background(Color(uiColor: .systemBackground))
      }
      
    }
    .frame(height: show ? UIScreen.screenHeight : 280)
    .scaleEffect(1 - activeView.height / 1000)
    .rotation3DEffect(.degrees(activeView.height), axis: (0, 10, 0))
    .hueRotation(.degrees(activeView.height))
    .gesture( show ?
              DragGesture()
      .onChanged { value in
        if value.translation.height < 300 && value.translation.height > 0 {
          activeView = value.translation
        }
      }
      .onEnded { value in
        if activeView.height > 50 {
          show = false
          active = false
          activeIndex = -1
        }
        
        activeView = .zero
      }
              : nil
    )
    .ignoresSafeArea()
  }
}

struct CourseView_Previews: PreviewProvider {
  static var previews: some View {
    CourseView(course: Course.mockData[0], show: .constant(false), active: .constant(false), index: 0, activeIndex: .constant(0), activeView: .constant(.zero))
  }
}
