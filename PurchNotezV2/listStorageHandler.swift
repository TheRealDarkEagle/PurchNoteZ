//
//  ListSaver.swift
//  PurchNotezV2
//
//  Created by Baur Versand on 02.04.20.
//  Copyright © 2020 Empiriecom. All rights reserved.
//

import Foundation

class SaveAndRead {
    
   fileprivate let defaults = UserDefaults.standard
   fileprivate let titleKey = "PN_tK0102110"
    
    /*
     Saves the list through UserDefaults.
     
     */
    func save(_ list: ShoppingList){
        let dispatch = DispatchQueue.global(qos: .utility)
        dispatch.async {
            self.saveItems(list.items.map{$0.description}, withTitle: list.title)
            self.saveTitle(list.title)
       }
    }
    private func saveItems(_ items:[String], withTitle title:String){
         defaults.set(items,forKey: title)
    }
    
    private func saveTitle(_ title: String){
        var titles = getTitles()
        print("the Titles are -> \(titles)")
        titles.append(title)
        defaults.set(titles,forKey: titleKey)
    }
    private func clearTitleList(){
        defaults.set(nil, forKey: titleKey)
    }
    
    
    func load(itemListTitle: String)->[String]?{
      return defaults.object(forKey: itemListTitle) as? [String]
    }
    
    func loadAll()->[ShoppingList]{
        var listEntrys =  [ShoppingList]()
        guard let shoppinglistKeys = load(itemListTitle: titleKey) else {
            return listEntrys
        }
        shoppinglistKeys.map{
            key in
            guard let itemdescription = load(itemListTitle: key) else { return }
            let shoppinglist = ShoppingList()
            shoppinglist.title = key
            for i in 0..<itemdescription.count{
                shoppinglist.add(itemdescription[i])
            }
            listEntrys.append(shoppinglist)
        }
       return listEntrys
    }
    
    private func getTitles()->[String]{
        defaults.object(forKey: titleKey) as? [String] ?? [String]()
    }
    
    func clearList(){
        if let titles =  load(itemListTitle: titleKey){
            titles.map{
                defaults.set(nil, forKey: $0)
                print("clearing Context of \($0)")
            }
        }
        clearTitleList()
    }
    
}
