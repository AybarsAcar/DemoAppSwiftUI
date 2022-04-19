//
//  Course.swift
//  DemoApp
//
//  Created by Aybars Acar on 10/4/2022.
//

import SwiftUI

struct Course: Identifiable {
  var id = UUID()
  var title: String
  var subtitle: String
  var image: URL
  var logo: UIImage
  var color: UIColor
  var show: Bool
  
}

extension Course {
  static var mockData = [
    Course(title: "Protyping for Designing in SwiftUI", subtitle: "18 Sections", image: URL(string: "https://dl.dropbox.com/s/dpq6sdc4kls3ntz/Card2%402x.png?dl=0")!, logo: #imageLiteral(resourceName: "Logo1"), color: #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1), show: false),
    Course(title: "Advanced Designing in SwiftUI", subtitle: "18 Sections", image: URL(string: "https://dl.dropbox.com/s/oiiz78l7urk9zj5/Card4%402x.png?dl=0")!, logo: #imageLiteral(resourceName: "Logo1"), color: #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1), show: false),
    Course(title: "UI Design for Developers", subtitle: "18 Sections", image: URL(string: "https://dl.dropbox.com/s/k8zmfd12n0i5cjw/Certificate%402x.png?dl=0")!, logo: #imageLiteral(resourceName: "Logo1"), color: #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1), show: false)
  ]
}
