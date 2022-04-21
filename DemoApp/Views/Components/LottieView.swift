//
//  LottieView.swift
//  DemoApp
//
//  Created by Aybars Acar on 21/4/2022.
//

import SwiftUI
import Lottie

struct LottieView: UIViewRepresentable {
  
  enum LottieAnimation: String {
    case loading = "loading"
    case success = "success"
  }
  
  var lottieAnimation: LottieAnimation
  
  init(_ lottieAnimation: LottieAnimation) {
    self.lottieAnimation = lottieAnimation
  }
  
  typealias UIViewType = UIView
  
  func makeUIView(context: Context) -> UIView {
    let view = UIView(frame: .zero)
    
    // create animation view
    let animationView = AnimationView()
    
    // get the file name of the lottie animation
    let animation = Animation.named(lottieAnimation.rawValue)
    
    animationView.animation = animation
    
    animationView.contentMode = .scaleAspectFit
    
    animationView.play()
    
    // deal with constraints to take the full width and height of the container
    animationView.translatesAutoresizingMaskIntoConstraints = false
    
    // add the subview
    view.addSubview(animationView)
    
    // max size of the container
    NSLayoutConstraint.activate([
      animationView.widthAnchor.constraint(equalTo: view.widthAnchor),
      animationView.heightAnchor.constraint(equalTo: view.heightAnchor)
    ])
    
    return view
  }
  
  func updateUIView(_ uiView: UIView, context: Context) {
    
  }
  
}
