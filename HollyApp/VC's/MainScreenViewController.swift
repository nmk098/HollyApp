//
//  ViewController.swift
//  HollyApp
//
//  Created by Никита Курюмов on 02.01.23.
//

import UIKit
import SpringAnimation

class MainScreenViewController: UIViewController {
  
    // MARK: View's
    
    private lazy var hollyView: UIView = {
        var view = UIView()
        view.backgroundColor = UIColor(patternImage: UIImage(named: "StoneT")!)
        view.translatesAutoresizingMaskIntoConstraints = false
       
        return view
    }()
    
    private lazy var secondHollyView: UIView = {
        var view = UIView()
        view.backgroundColor = UIColor(patternImage: UIImage(named: "stoneT2")!)
        view.translatesAutoresizingMaskIntoConstraints = false
       
        return view
    }()
    
    // MARK: Button's
    
    private lazy var oldFaithButton: UIButton = {
        var button = UIButton()
        button.setTitle("Old Faith", for: .normal)
        button.tintColor = .black
        button.addTarget(self, action: #selector(OFButtonTapp), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var newFaithButton: UIButton = {
        var button = UIButton()
        button.setTitle("New Faith", for: .normal)
        button.tintColor = .black
        button.addTarget(self, action: #selector(NFButtonTapp), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var hollyDayButton: UIButton = {
        var button = UIButton()
        button.setTitle("What month is?", for: .normal)
        button.tintColor = .black
        button.addTarget(self, action: #selector(HDButtonTap), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private var animationStarted = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "God bless you!"
        
        view.backgroundColor = UIColor(patternImage: UIImage(named: "TableViewBG")!)
        view.addSubview(hollyView)
        view.addSubview(secondHollyView)
        view.addSubview(oldFaithButton)
        view.addSubview(newFaithButton)
        view.addSubview(hollyDayButton)
        hollyView.isHidden = true
        secondHollyView.isHidden = true
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        hollyView.frame = CGRect(
            x: UIScreen.main.bounds.midX - 50,
            y: 100, 
            width: 100,
            height: 100)
        
        secondHollyView.frame = CGRect(
            x: UIScreen.main.bounds.midX - 50,
            y: 100,
            width: 100,
            height: 100)
        
        hollyView.layer.cornerRadius = hollyView.frame.height / 2
        secondHollyView.layer.cornerRadius = secondHollyView.frame.height / 2
        oldFaithButton.layer.cornerRadius = oldFaithButton.frame.height / 2
        newFaithButton.layer.cornerRadius = newFaithButton.frame.height / 2
        hollyDayButton.layer.cornerRadius = hollyDayButton.frame.height / 2
        
  NSLayoutConstraint.activate([
      oldFaithButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -240),
      oldFaithButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40),
      oldFaithButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -240)
   ])
        
  NSLayoutConstraint.activate([
            newFaithButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -240),
            newFaithButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 240),
            newFaithButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -40)
         ])
        
        NSLayoutConstraint.activate([
            hollyDayButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -140),
            hollyDayButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40),
            hollyDayButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -40)
        ])
    }
    
    @objc
    private func OFButtonTapp() {
        oldFaithButton.pulsate()
        hollyView.isHidden = false
        secondHollyView.isHidden = true
        let start = self.hollyView.center
        
        UIView.animateKeyframes(withDuration: 4.5, delay: 0, options: [.calculationModePaced, .repeat]) {
            UIView.addKeyframe(withRelativeStartTime: 0.25, relativeDuration: 0.15) {
                self.hollyView.frame.origin.y = UIScreen.main.bounds.midY
            }
            UIView.addKeyframe(withRelativeStartTime: 0.25, relativeDuration: 0.30) {
                self.hollyView.frame.origin.y = UIScreen.main.bounds.midY - (UIScreen.main.bounds.midY / 2)
                self.hollyView.frame.origin.x += 120
            }
            UIView.addKeyframe(withRelativeStartTime: 0.25, relativeDuration: 0.30) {
                self.hollyView.frame.origin.x -= 240
            }
            UIView.addKeyframe(withRelativeStartTime: 0.25, relativeDuration: 0.25) {
                self.hollyView.center = start
            }
        }
        
    }
    
    @objc
    private func NFButtonTapp() {
        newFaithButton.pulsate()
        hollyView.isHidden = true
        secondHollyView.isHidden = false
        let start = self.secondHollyView.center
        
        UIView.animateKeyframes(withDuration: 3.25, delay: 0, options: [.calculationModePaced, .repeat]) {
            UIView.addKeyframe(withRelativeStartTime: 0.25, relativeDuration: 0.15) {
                self.secondHollyView.frame.origin.y = UIScreen.main.bounds.midY
            }
            UIView.addKeyframe(withRelativeStartTime: 0.25, relativeDuration: 0.30) {
                self.secondHollyView.frame.origin.y = UIScreen.main.bounds.midY - (UIScreen.main.bounds.midY / 2)
                self.secondHollyView.frame.origin.x += 120
            }
            UIView.addKeyframe(withRelativeStartTime: 0.25, relativeDuration: 0.30) {
                self.secondHollyView.frame.origin.x -= 240
            }
            UIView.addKeyframe(withRelativeStartTime: 0.25, relativeDuration: 0.25) {
                self.secondHollyView.center = start
            }
        }
        
    }
    
    @objc
    private func HDButtonTap() {
        hollyView.isHidden = true
        secondHollyView.isHidden = true
       let hollyDaysVC = HollyDaysViewController()
        navigationController?.pushViewController(hollyDaysVC, animated: true)
        }
    
   
    }


