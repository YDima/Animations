//
//  SnowViewController.swift
//  ThreeAnimations
//
//  Created by Dmytro Yurchenko on 3.2.21.
//

import UIKit

class SnowViewController: UIViewController {

    @IBOutlet weak var makeSnow: UIButton!
    private let snow = SnowFlakeView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeSnow.layer.cornerRadius = makeSnow.frame.height / 5
        let sky = SkyView()
        sky.startColor = #colorLiteral(red: 0.002352767758, green: 0.5326642951, blue: 1, alpha: 1)
        sky.endColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        sky.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(sky)
        
        snow.snowFlakeImage = #imageLiteral(resourceName: "snow")
        snow.snowFlakeLifeTime = 20.0
        snow.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(snow)
        
        view.addSubview(makeSnow)

        NSLayoutConstraint.activate([
            sky.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            sky.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            sky.topAnchor.constraint(equalTo: view.topAnchor),
            sky.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            snow.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            snow.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            snow.topAnchor.constraint(equalTo: view.topAnchor),
            snow.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    @IBAction func makeItSnow(_ sender: Any) {
        
        if makeSnow.currentTitle == "Make it snow" {
            makeSnow.setTitle("Make it stop", for: .normal)
            snow.changeMode(10.0)
            view.reloadInputViews()
        } else if makeSnow.currentTitle == "Make it stop" {
            makeSnow.setTitle("Make it snow", for: .normal)
            snow.changeMode(0)
            view.reloadInputViews()
        }
        
    }
}
