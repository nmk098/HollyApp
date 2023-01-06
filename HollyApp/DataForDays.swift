//
//  DataForDays.swift
//  HollyApp
//
//  Created by Никита Курюмов on 07.01.23.
//

import Foundation


struct HolliDays {
    var subMenu: String!
    var menu: [String]!
    var isStatus: Bool!
    
    init(subMenu: String, menu: [String], isStatus: Bool) {
        self.subMenu = subMenu
        self.menu = menu
        self.isStatus = isStatus
    }
}
