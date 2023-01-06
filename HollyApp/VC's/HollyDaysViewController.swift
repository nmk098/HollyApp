//
//  HollyDaysViewController.swift
//  HollyApp
//
//  Created by Никита Курюмов on 06.01.23.
//

import UIKit

class HollyDaysViewController: UIViewController {
    
    private lazy var hollyDays: UITableView = {
        var tableView = UITableView()
        tableView.rowHeight = 40
        tableView.estimatedRowHeight = 2
        tableView.insetsContentViewsToSafeArea = true
        tableView.fillerRowHeight = 40
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(hollyDays)
        view.backgroundColor = .systemRed
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        hollyDays.frame = CGRect(
            x: 0,
            y: 0,
            width: UIScreen.main.bounds.width,
            height: UIScreen.main.bounds.height
        )
    }
   

}
