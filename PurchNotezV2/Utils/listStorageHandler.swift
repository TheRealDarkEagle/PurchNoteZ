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
    
    func save(_ list: ShoppingList) {
        let itemdescriptions = list.items.map {item in item.description}
        datahandler.createNewList(listTitle: list.title, items: itemdescriptions)
    }
   
    fileprivate func createShoppingListOf(_ key: String, _ itemdescription: [String]) -> ShoppingList {
        let shoppinglist = ShoppingList()
        shoppinglist.title = key
        for counter in 0..<itemdescription.count {
            shoppinglist.add(itemdescription[counter])
        }
       return shoppinglist
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
