//
//  DataHandler.swift
//  PurchNotezV2
//
//  Created by Baur Versand on 06.05.20.
//  Copyright © 2020 Empiriecom. All rights reserved.
//

import UIKit
import CoreData

class DataHandler {
    var managedObjectContext: NSManagedObjectContext! = {
        var context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
        return context
    }()
}

extension DataHandler {
	
    func createShoppingItem(description: String) -> ShoppingItem {
        let item = ShoppingItem(context: managedObjectContext)
        item.text = description
        return item
    }
	
    func createShoppingList(title: String) -> ShoppingItemList {
        let list = ShoppingItemList(context: managedObjectContext)
        list.id = UUID()
        list.title = title
        return list
    }
    
    func loadData() -> [ShoppingItemList] {
        var lists = [ShoppingItemList]()
        let listFetchRequest: NSFetchRequest<ShoppingItemList> = ShoppingItemList.fetchRequest()
        do {
             lists = try managedObjectContext.fetch(listFetchRequest)
        } catch {
            print("Could not load from Database \(error.localizedDescription)")
        }
        return lists
    }
    
    func createNewList(listTitle title: String, items: [String]) {
        let list = createShoppingList(title: title)
        _ = items.map { text in list.addToItems(createShoppingItem(description: text))}
        save()
    }
	
    func delete(entry: ShoppingItemList) {
        managedObjectContext.delete(entry)
        save()
    }
	
    private func save() {
        do {
            try managedObjectContext.save()
        } catch {
            print("Could not save Data to Database -> \(error.localizedDescription)")
        }
    }
	
    func deleteAll() {
        let list = loadData()
		_ = list.map { item in
            managedObjectContext.delete(item)
        }
        save()
    }
}
