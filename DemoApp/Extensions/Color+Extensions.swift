//
//  Color+Extensions.swift
//  DemoApp
//
//  Created by Aybars Acar on 9/4/2022.
//

import SwiftUI

struct AppTheme {
  let accent = Color("accent")
  
  let background1 = Color("background1")
  let background2 = Color("background2")
  let background3 = Color("background3")
  
  let card1 = Color("card1")
  let card2 = Color("card2")
  let card3 = Color("card3")
  let card4 = Color("card4")
  let card5 = Color("card5")

  let primary = Color("primary")
  let secondary = Color("secondary")
  
  let lightGray = Color("light-grey")
  let blueGray = Color("blue-gray")
  
  let maroon = Color("maroon")
  let eggplant = Color("eggplant")
  
  let darkBlue = Color("dark-blue")
  let lightBlue = Color("light-blue")
}

extension Color {
  static let theme = AppTheme()
}
