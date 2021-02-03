//
//  ViewController.swift
//  Circles
//
//  Created by Dmytro Yurchenko on 2.2.21.
//

import UIKit

class ViewController: UIViewController {
          
     @IBOutlet weak var circleView: CircleView!
     
     override func viewDidLoad() {
          super.viewDidLoad()
     }
     
     @IBAction func start(_ sender: UIButton) {
          circleView.updateAnimation()
     }
     
}

class CircleView: UIView {
     private var __isAnimating: Bool = true
     
     private var color: UIColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
     
     private lazy var circleLayers = create()
     
     override init(frame: CGRect) {
          super.init(frame: frame)
          circleLayers.forEach { layer.addSublayer($0) }
     }
     
     required init?(coder: NSCoder) {
          super.init(coder: coder)
          circleLayers.forEach { layer.addSublayer($0) }
     }
     
     override func layoutSubviews() {
          super.layoutSubviews()
          circleLayers.forEach { $0.frame = bounds}
          circleLayers.forEach { $0.anchorPoint = CGPoint(x: 0.5, y: 0.5) }
     }
     
     private func create() -> [CAShapeLayer] {
          var circleLayers: [CAShapeLayer] = []
          
          while circleLayers.count <= 3 {
               let circleShape = CAShapeLayer()
               
               let circlePath = UIBezierPath(
                    arcCenter: CGPoint(x: bounds.width * 0.5, y: bounds.height * 0.5),
                    radius: bounds.height * 0.5,
                    startAngle: 0,
                    endAngle: .pi * 2,
                    clockwise: false)
               
               circleShape.path = circlePath.cgPath
               circleShape.fillColor = color.cgColor
               circleShape.opacity = 0
               
               circleLayers.append(circleShape)
          }
          
          return circleLayers
     }
     
     func updateAnimation() {
          
          __isAnimating = !__isAnimating

          guard !__isAnimating else { return circleLayers.forEach{$0.removeAllAnimations()} }
          
          circleLayers.enumerated().forEach {(index, layer) in
               let opacity = CABasicAnimation(keyPath: "opacity")
               opacity.fromValue = 1
               opacity.toValue = 0
               
               let scale = CABasicAnimation(keyPath: "transform.scale")
               scale.fromValue = 0
               scale.toValue = 1
               
               let animationGroup = CAAnimationGroup()
               animationGroup.animations = [opacity, scale]
               
               animationGroup.duration = 3
               animationGroup.repeatCount = .infinity
               animationGroup.beginTime = CACurrentMediaTime() + 0.5 * Double(index)
               
               layer.add(animationGroup, forKey: nil)
          }
     }
     
}
