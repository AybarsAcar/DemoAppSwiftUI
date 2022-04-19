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
      contentfulEntries.forEach { item in
        self?.courses.append(
          Course(
            title: item.fields["title"] as! String,
            subtitle: item.fields["subtitle"] as! String,
            image: UIImage(named: "Card1")!,
            logo: UIImage(named: "Logo1")!,
            color: .systemPurple,
            show: false
          )
        )
      }
    }
  }
}
