//
//  PartyViewController.swift
//  ThreeAnimations
//
//  Created by Dmytro Yurchenko on 3.2.21.
//

import UIKit

class PartyViewController: UIViewController {
    
    private var confetti = ConfettiView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let background = BackgroundView()
        background.startColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        background.endColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        background.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(background)
        
        let happy = UILabel()
        happy.text = "Happy Birthday"
        happy.textColor = #colorLiteral(red: 0.9959564805, green: 0.7601529956, blue: 0.8575319648, alpha: 1)
        happy.font = UIFont(name: "Arial Rounded MT Bold", size: 38)
        happy.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(happy)
        
        let cake = UIImageView(image: #imageLiteral(resourceName: "birthday-cake"))
        cake.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(cake)
        
        confetti.confettiImage = #imageLiteral(resourceName: "confetti")
        confetti.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(confetti)
        
        NSLayoutConstraint.activate([
            happy.topAnchor.constraint(equalTo: view.topAnchor, constant: 133),
            happy.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cake.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cake.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            background.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            background.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            background.topAnchor.constraint(equalTo: view.topAnchor),
            background.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            confetti.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            confetti.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            confetti.topAnchor.constraint(equalTo: view.topAnchor),
            confetti.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
}

class BackgroundView: UIView {
    var startColor: UIColor = UIColor.white
    var endColor: UIColor = UIColor.white
    
    override class var layerClass: AnyClass {
        return CAGradientLayer.self
    }
    
    override func layoutSubviews() {
        (layer as! CAGradientLayer).colors = [startColor.cgColor, endColor.cgColor]
    }
}
