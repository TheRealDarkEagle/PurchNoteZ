//
//  ListSaver.swift
//  PurchNotezV2
//
//  Created by Baur Versand on 02.04.20.
//  Copyright © 2020 Empiriecom. All rights reserved.
//

import Foundation

class DataStorageHandler {
    
    let datahandler = DataHandler()
    
    func save(_ list: ShoppingItemList) {
		datahandler.save()
    }
  
    func loadAll() -> [ShoppingItemList] {
        datahandler.loadData()
    }
    
    func delete(entry: ShoppingItemList) {
        datahandler.delete(entry: entry)
    }
    
    func clearList() {
        datahandler.deleteAll()
    }
}
