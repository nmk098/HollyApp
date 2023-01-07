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
        tableView.backgroundColor = UIColor(patternImage: UIImage(named: "TableViewBG")!)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        return tableView
    }()
    
    let identifire = "holly day"
   
    
    var menuData = [
        HolliDays(
            subMenu: "Январь",
            menu: ["Good month for pray!"],
            isStatus: false
        ),
        HolliDays(
            subMenu: "Февраль",
            menu: ["Good month for pray!"],
            isStatus: false
        ),
        HolliDays(
            subMenu: "Март",
            menu: ["Good month for pray!"],
            isStatus: false
        ),
        HolliDays(
            subMenu: "Апрель",
            menu: ["Good month for pray!"],
            isStatus: false
        ),
        HolliDays(
            subMenu: "Май",
            menu: ["Good month for pray!"],
            isStatus: false
        ),
        HolliDays(
            subMenu: "Июнь",
            menu: ["Good month for pray!"],
            isStatus: false
        ),
        HolliDays(
            subMenu: "Июль",
            menu: ["Good month for pray!"],
            isStatus: false
        ),
        HolliDays(
            subMenu: "Август",
            menu: ["Good month for pray!"],
            isStatus: false
        ),
        HolliDays(
            subMenu: "Сентябрь",
            menu: ["Good month for pray!"],
            isStatus: false
        ),
        HolliDays(
            subMenu: "Октябрь",
            menu: ["Good month for pray!"],
            isStatus: false
        ),
        HolliDays(
            subMenu: "Ноябрь",
            menu: ["Good month for pray!"],
            isStatus: false
        ),
        HolliDays(
            subMenu: "Декабрь",
            menu: ["Good month for pray!"],
            isStatus: false
        )
        
        
        
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(hollyDays)
        view.backgroundColor = .gray

        
        
        hollyDays.register(UITableViewCell.self, forCellReuseIdentifier: identifire)
        
        hollyDays.delegate = self
        
        hollyDays.dataSource = self
        
        hollyDays.tableFooterView = UIView()
        
        
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

extension HollyDaysViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
      if  menuData[indexPath.section].isStatus {
            return 44
      } else { return 0 }
    }
}

extension HollyDaysViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuData[section].menu.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifire)
        cell?.textLabel?.text = menuData[indexPath.section].menu[indexPath.row]
        return cell!
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return menuData.count
    }
}
    extension HollyDaysViewController: ExpanadableHeaderViewDelegate {
        
        func toggleSection(header: ExpanadableHeaderView, section: Int) {
            menuData[section].isStatus = !menuData[section].isStatus
            
            hollyDays.beginUpdates()
            
            for i in 0..<menuData[section].menu.count{
                hollyDays.reloadRows(at: [IndexPath(row: i, section: section)], with: .automatic)
            }
            
            hollyDays.endUpdates()
        }
        
        func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
            let header = ExpanadableHeaderView()
            
            header.customInit(title: menuData[section].subMenu, section: section, delegate: self)
            
            return header
        }
    }

