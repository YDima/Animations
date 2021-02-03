//
//  ConfettiView.swift
//  ThreeAnimations
//
//  Created by Dmytro Yurchenko on 3.2.21.
//

import UIKit

class ConfettiView: UIView {
    var confettiImage: UIImage?
    var emitter: CAEmitterLayer!
    
    var colors: [UIColor] = [.blue, .cyan, .yellow, .red, .orange]
    
    override class var layerClass: AnyClass {
        return CAEmitterLayer.self
    }
    
    func makeEmitterCell(color: UIColor, velocity: CGFloat, scale: CGFloat) -> CAEmitterCell {
        let cell = CAEmitterCell()
        cell.birthRate = 5
        cell.lifetime = 33.0
        cell.lifetimeRange = 0
        cell.color = color.cgColor
        cell.velocity = velocity
        cell.velocityRange = velocity / 4
        cell.emissionLongitude = .pi
        cell.emissionRange = .pi / 8
        cell.yAcceleration = 90
        cell.color = colors.randomElement()?.cgColor
        cell.spin = 0
        cell.spinRange = 5
        cell.scale = scale
        cell.scaleRange = scale / 3
        cell.contents = confettiImage?.cgImage
        return cell
    }
    
    override func layoutSubviews() {
        emitter = (self.layer as! CAEmitterLayer)
        emitter.emitterShape = .line
        emitter.emitterPosition = CGPoint(x: bounds.midX, y: 0)
        emitter.emitterSize = CGSize(width: bounds.size.width, height: 1)
        
        let near = makeEmitterCell(color: UIColor(white: 1, alpha: 1), velocity: 100, scale: 0.6)
        let middle = makeEmitterCell(color: UIColor(white: 1, alpha: 0.66), velocity: 80, scale: 0.4)
        let far = makeEmitterCell(color: UIColor(white: 1, alpha: 0.33), velocity: 60, scale: 0.3)
        
        emitter.emitterCells = [near, middle, far]
    }
    
}
