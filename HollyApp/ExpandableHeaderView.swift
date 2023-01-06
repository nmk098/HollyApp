//
//  ExpandableHeaderView\.swift
//  HollyApp
//
//  Created by Никита Курюмов on 07.01.23.
//

import UIKit

protocol ExpanadableHeaderViewDelegate {
    
    func toggleSection(header: ExpanadableHeaderView, section: Int)
    }

class ExpanadableHeaderView: UITableViewHeaderFooterView {
    
    var section: Int!
    var delegate: ExpanadableHeaderViewDelegate?
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
   
        let tapHeader = UITapGestureRecognizer(target: self, action: #selector(clickingOnSubmenu))
        
        self.addGestureRecognizer(tapHeader)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) hsd not been implimented")
    }
        @objc func  clickingOnSubmenu(gestureRecognizer: UITapGestureRecognizer) {
            let cell = gestureRecognizer.view as! ExpanadableHeaderView
            delegate?.toggleSection(header: self, section: cell.section)
        }
    
    func customInit(title: String, section: Int, delegate: ExpanadableHeaderViewDelegate) {
        self.textLabel?.text = title
        self.section = section
        self.delegate = delegate
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.textLabel?.textColor = .black
        self.contentView.backgroundColor = UIColor(patternImage: UIImage(named: "TableViewBG")!)
        self.textLabel?.font = UIFont.boldSystemFont(ofSize: 17)
    }
    }

