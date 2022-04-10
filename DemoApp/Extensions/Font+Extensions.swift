//
//  Font+Extensions.swift
//  DemoApp
//
//  Created by Aybars Acar on 10/4/2022.
//

import SwiftUI

extension Font {
  static func workSansBold(size: CGFloat = 28) -> Font {
    return .custom("WorkSans-Bold", size: size)
  }
  
  static func workSansRegular(size: CGFloat = 28) -> Font {
    return .custom("WorkSans-Regular", size: size)
  }
}
