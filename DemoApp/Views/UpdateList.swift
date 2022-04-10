//
//  UpdateList.swift
//  DemoApp
//
//  Created by Aybars Acar on 9/4/2022.
//

import SwiftUI

struct UpdateList: View {
  
  @StateObject private var viewModel = UpdateStore()
  
  var body: some View {
    NavigationView {
      List {
        ForEach(viewModel.updates) { update in
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
        .onDelete { indexSet in
          viewModel.updates.remove(at: indexSet.first!)
        }
        .onMove { source, destination in
          viewModel.updates.move(fromOffsets: source, toOffset: destination)
        }
      }
      .listStyle(.plain)
      .navigationTitle("Updates")
      .toolbar {
        ToolbarItem(placement: .navigationBarLeading) {
          Button {
            addUpdate()
          } label: {
            Text("Add Update")
          }
        }
        
        ToolbarItem(placement: .navigationBarTrailing) {
          EditButton()
        }
      }
    }
  }
}

extension UpdateList {
  private func addUpdate() {
    viewModel.updates.append(Update(image: "Card1", title: "New Item", text: "text", date: "Jan 1"))
  }
}

struct UpdateList_Previews: PreviewProvider {
  static var previews: some View {
    UpdateList()
  }
}
