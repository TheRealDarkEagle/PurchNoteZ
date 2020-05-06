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
    
    
    /*
     Saves the list through UserDefaults.
     */
    func save(_ list: ShoppingList){
        let itemdescriptions = list.items.map{item in item.description}
        datahandler.createNewList(listTitle: list.title, items: itemdescriptions)
    }
   
    
    fileprivate func createShoppingListOf(_ key: String, _ itemdescription: [String])-> ShoppingList {
        let shoppinglist = ShoppingList()
        shoppinglist.title = key
        for i in 0..<itemdescription.count{
            shoppinglist.add(itemdescription[i])
        }
       return shoppinglist
    }
    
    
    func loadAll()->[ShoppingItemList]{
        datahandler.loadData()
    }
    
    func delete(entry: ShoppingItemList){
        datahandler.delete(entry: entry)
    }
    
    func clearList(){
        print("IMPLEMENT CLEARLIST1111!!!")
    }
    
    
}
