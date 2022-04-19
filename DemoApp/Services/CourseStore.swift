//
//  CourseStore.swift
//  DemoApp
//
//  Created by Aybars Acar on 12/4/2022.
//

import SwiftUI
import Contentful
import Combine

final class CMSService {
  static let shared = CMSService()
  
  private let client: Client
  
  init() {
    guard let spaceID = Bundle.main.object(forInfoDictionaryKey: "SPACE_ID") as? String,
          let accessToken = Bundle.main.object(forInfoDictionaryKey: "ACCESS_TOKEN") as? String
    else {
      fatalError()
    }
    
    self.client = Client(spaceId: spaceID, accessToken: accessToken)
  }
  
  func get(withContentfulID id: String, completion: @escaping (_ contentfulEntries: [Entry]) -> Void) {
    let query = Query.where(contentTypeId: id)
    
    client.fetchArray(of: Entry.self, matching: query) { result in
      switch result {
      case .success(let entry):
        DispatchQueue.main.async {
          completion(entry.items)
        }
        
      case .failure(let error):
        print(error)
      }
    }
  }
}

final class CourseStoreViewModel: ObservableObject {
  @Published var courses: [Course] = Course.mockData
  
  init() {
    CMSService.shared.get(withContentfulID: "course") { [weak self] contentfulEntries in
      
      let colors = [#colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1), #colorLiteral(red: 0.3236978054, green: 0.1063579395, blue: 0.574860394, alpha: 1), #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1), #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1), #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1), #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1), #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1), #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)]
      
      contentfulEntries.forEach { item in
        self?.courses.append(
          Course(
            title: item.fields["title"] as! String,
            subtitle: item.fields["subtitle"] as! String,
            image: item.fields.linkedAsset(at: "image")?.url ?? URL(string: "")!,
            logo: UIImage(named: "Logo1")!,
            color: colors.randomElement()!,
            show: false
          )
        )
      }
    }
  }
}
