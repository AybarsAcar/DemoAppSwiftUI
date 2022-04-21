//
//  UIApplication+Extensions.swift
//  DemoApp
//
//  Created by Aybars Acar on 21/4/2022.
//

import SwiftUI

extension UIApplication {
  
  /// extension function to dismiss the keyboard
  /// ```
  /// UIApplication.shared.endEditing()
  /// ```
  func endEditing() {
    
    // send an obj-c function to dissmiss the keyboard
    sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
  }

}
