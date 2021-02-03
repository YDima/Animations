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
        
        confetti.confettiImage = #imageLiteral(resourceName: "confetti")
        confetti.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(confetti)
        
        NSLayoutConstraint.activate([
            confetti.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            confetti.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            confetti.topAnchor.constraint(equalTo: view.topAnchor),
            confetti.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
}
