//
//  BlurView.swift
//  DemoApp
//
//  Created by Aybars Acar on 19/4/2022.
//

import SwiftUI

struct BlurView: UIViewRepresentable {
  typealias UIViewType = UIView
  
  let style: UIBlurEffect.Style
  
  init(withStyle style: UIBlurEffect.Style = .systemMaterial) {
    self.style = style
  }
  
  func makeUIView(context: Context) -> UIView {
    let view = UIView(frame: CGRect.zero)
    
    view.backgroundColor = .clear
    
    let blurEffect = UIBlurEffect(style: style)
    let blurView = UIVisualEffectView(effect: blurEffect)
    
    blurView.translatesAutoresizingMaskIntoConstraints = false
    
    // at is like z-index
    // set it to 0 so it's underneath all other views
    view.insertSubview(blurView, at: 0)
    
    NSLayoutConstraint.activate([
      blurView.widthAnchor.constraint(equalTo: view.widthAnchor),
      blurView.heightAnchor.constraint(equalTo: view.heightAnchor)
    ])
    
    return view
  }
  
  func updateUIView(_ uiView: UIView, context: Context) {
    
  }
}
