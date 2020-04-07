//
//  Item.swift
//  PurchNotezV2
//
//  Created by Baur Versand on 30.03.20.
//  Copyright © 2020 Empiriecom. All rights reserved.
//

import Foundation

struct Item {
    var description : String
    //var titel : Substring
    
    func getTitle()->String{
        String(description.prefix(1)).uppercased()
    }
}
