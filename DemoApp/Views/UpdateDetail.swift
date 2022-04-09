//
//  UpdateDetail.swift
//  DemoApp
//
//  Created by Aybars Acar on 9/4/2022.
//

import SwiftUI

struct UpdateDetail: View {
  
  let update: Update
  
  var body: some View {
    
    ScrollView {
      VStack {
        
        Image(update.image)
          .resizable()
          .scaledToFit()
          .frame(maxWidth: .infinity)
        
        Text(update.text)
          .multilineTextAlignment(.leading)
      }
      .padding(.horizontal)
      .navigationTitle(update.title)
    }
  }
}

struct UpdateDetail_Previews: PreviewProvider {
  static var previews: some View {
    NavigationView {
      UpdateDetail(update: Update.mockData[0])
    }
  }
}
