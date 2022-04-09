//
//  UpdateList.swift
//  DemoApp
//
//  Created by Aybars Acar on 9/4/2022.
//

import SwiftUI

struct UpdateList: View {
    var body: some View {
      NavigationView {
        List(Update.mockData) { update in
          NavigationLink(destination: UpdateDetail(update: update)) {
            HStack {
              Image(update.image)
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80)
                .background(.black)
                .cornerRadius(20)
                .padding(.trailing, 4)
              
              VStack(alignment: .leading, spacing: 8) {
                Text(update.title)
                  .font(.system(size: 20, weight: .bold))
                
                Text(update.text)
                  .lineLimit(2)
                  .font(.subheadline)
                  .foregroundColor(.theme.secondary)
                
                Text(update.date)
                  .font(.caption)
                  .fontWeight(.bold)
                  .foregroundColor(.secondary)
              }
            }
            .padding(.vertical, 8)
          }
        }
        .listStyle(.plain)
        .navigationTitle("Updates")
      }
    }
}

struct UpdateList_Previews: PreviewProvider {
    static var previews: some View {
        UpdateList()
    }
}
