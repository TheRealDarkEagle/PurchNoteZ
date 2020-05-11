//
//  ShoppingList.swift
//  PurchNotezV2
//
//  Created by Baur Versand on 30.03.20.
//  Copyright © 2020 Empiriecom. All rights reserved.
//

import Foundation

class ShoppingList {
    
    var title: String = ""
    var items = [Item]() 
    
    func add(_ string: String) {
        items.append(Item(description: string, checked: false))
    }
}
