//
//  CardView.swift
//  DemoApp
//
//  Created by Aybars Acar on 9/4/2022.
//

import SwiftUI

struct CardView: View {
  var body: some View {
    VStack {
      HStack {
        VStack(alignment: .leading) {
          Text("UI Design")
            .font(.title)
            .fontWeight(.semibold)
            .foregroundColor(.white)
          
          Text("Certificate")
            .foregroundColor(.theme.accent)
        }
        
        Spacer()
        
        Image("Logo1")
      }
      .padding(.horizontal, 20)
      .padding(.top, 20)
      
      Spacer()
      Image("Card1")
        .resizable()
        .scaledToFill()
        .frame(width: 300, height: 110, alignment: .top)
    }
  }
}


struct CardView_Previews: PreviewProvider {
  static var previews: some View {
    CardView()
  }
}
