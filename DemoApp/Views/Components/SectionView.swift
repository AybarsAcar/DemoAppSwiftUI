//
//  SectionView.swift
//  DemoApp
//
//  Created by Aybars Acar on 9/4/2022.
//

import SwiftUI

struct SectionView: View {
  
  let section: Section
  let width: CGFloat
  let height: CGFloat
  
  init(section: Section, width: CGFloat = 275, height: CGFloat = 275) {
    self.section = section
    self.width = width
    self.height = height
  }
  
  var body: some View {
    VStack {
      HStack(alignment: .top) {
        Text(section.title)
          .font(.system(size: 24, weight: .bold))
          .frame(width: 160, alignment: .leading)
          .foregroundColor(.white)
        
        Spacer()
        
        Image(section.logo)
      }
      
      Text(section.text.uppercased())
        .frame(maxWidth: .infinity, alignment: .leading)
      
      section.image
        .resizable()
        .scaledToFit()
        .frame(width: 210)
    }
    .padding(.top, 20)
    .padding(.horizontal, 20)
    .frame(width: width, height: height)
    .background(section.color)
    .cornerRadius(30)
    .shadow(color: section.color.opacity(0.3), radius: 20, x: 0, y: 20)
  }
}

struct SectionView_Previews: PreviewProvider {
  static var previews: some View {
    SectionView(section: Section.mockData[0])
  }
}
