//
//  ViewController.swift
//  HollyApp
//
//  Created by Никита Курюмов on 02.01.23.
//

import UIKit
import SpringAnimation

class ViewController: UIViewController {
    
    private lazy var hollyView: UIView = {
        var view = UIView()
        view.backgroundColor = .blue
        view.translatesAutoresizingMaskIntoConstraints = false
       
        return view
    }()
    
    private var animationStarted = false
    
    private lazy var oldFaithButton: UIButton = {
        var button = UIButton()
        button.setTitle("Old Faith", for: .normal)
        button.backgroundColor = .systemGreen
        button.addTarget(self, action: #selector(OFButtonTapp), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        view.addSubview(hollyView)
        view.addSubview(oldFaithButton)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        hollyView.frame = CGRect(
            x: UIScreen.main.bounds.midX - 50,
            y: 80, 
            width: 100,
            height: 100)
        
        
        hollyView.layer.cornerRadius = hollyView.frame.height / 2
        oldFaithButton.layer.cornerRadius = oldFaithButton.frame.height / 2
        
  NSLayoutConstraint.activate([
      oldFaithButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -240),
      oldFaithButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40),
      oldFaithButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -240)
   ])
    }
    
    @objc
    private func OFButtonTapp() {
        oldFaithButton.pulsate()
        
        let start = self.hollyView.center
        
        UIView.animateKeyframes(withDuration: 5, delay: 0, options: [.calculationModePaced, .repeat]) {
            UIView.addKeyframe(withRelativeStartTime: 0.25, relativeDuration: 0.25) {
                self.hollyView.frame.origin.y += 200
            }
            UIView.addKeyframe(withRelativeStartTime: 0.25, relativeDuration: 0.25) {
                self.hollyView.frame.origin.y -= 100
                self.hollyView.frame.origin.x += 80
            }
            UIView.addKeyframe(withRelativeStartTime: 0.25, relativeDuration: 0.25) {
                self.hollyView.frame.origin.x -= 160
            }
            UIView.addKeyframe(withRelativeStartTime: 0.25, relativeDuration: 0.25) {
                self.hollyView.center = start
            }
        }
        
    }
}
