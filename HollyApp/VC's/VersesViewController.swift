//
//  VersesViewController.swift
//  HollyApp
//
//  Created by Никита Курюмов on 07.01.23.
//

import UIKit

class VersesViewController: UIViewController {
    
    private lazy var getVerseButton: UIButton = {
        var button = UIButton()
        button.setTitle("get random verse", for: .normal)
        //v button.addTarget(self, action: #selector(getVerseButtonTap), for: .touchUpInside)
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private lazy var verseLabel: UILabel = {
        var label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.text = "Do you need some Jesus?"
        label.textAlignment = .center
        label.backgroundColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(patternImage: UIImage(named: "TableViewBG")!)
        view.addSubview(getVerseButton)
        view.addSubview(verseLabel)
        fetchVerse()
    }
    
    override func viewWillLayoutSubviews() {
        NSLayoutConstraint.activate([
            getVerseButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -140),
            getVerseButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40),
            getVerseButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -40)
        ])
        
        NSLayoutConstraint.activate([
            verseLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            verseLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            verseLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            verseLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -220)
        ])
    }
    
    private func fetchVerse() {
        guard let url = URL(string: "api.scripture.api.bible") else { return }
        
        URLSession.shared.dataTask(with: url) { [weak self] data, responce, error in
            
            guard let data, let responce else {
                print(error?.localizedDescription ?? "no error description")
                return
            }
        }.resume()
    }
}
