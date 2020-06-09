//
//  VC_Extension_UtilFunctions.swift
//  PurchNotezV2
//
//  Created by Baur Versand on 09.06.20.
//  Copyright © 2020 Empiriecom. All rights reserved.
//

import UIKit

	// MARK: - Utility Functionality

extension CreateShoppingListVC {
	
    func requestTitle() {
	   let alertController = UIAlertController(title: "Titel eingeben", message: "Bitte bennene deinen Einkaufszettel", preferredStyle: .alert)
	   alertController.addTextField()
	   let alertAction = UIAlertAction(title: "OK", style: .default) { [weak self, weak alertController] _ in
		   guard let txt = alertController?.textFields?[0].text else { return }
		   if txt.isEmpty {
			   return
		   }
		   self?.listTitle = txt
		   self?.title = txt
		   
	   }
	   alertController.addAction(alertAction)
	   self.present(alertController, animated: true)
   }
	
	@objc func newItem() {
		addItem()
	}

	func addItem() {
	   let alertController = UIAlertController(title: "Was benötigst du noch?", message: nil, preferredStyle: .alert)
	   alertController.addTextField()
	   
	   let submitAction = UIAlertAction(title: "Hinzufügen", style: .default) { [weak self, weak alertController] _ in guard let txt = alertController?.textFields?[0].text else { return }
		self?.items.append(txt)
		self?.reloadCollection()
	   }
	   alertController.addAction(submitAction)
	   self.present(alertController, animated: true)
   }

   func reloadCollection() {
	   collectionView.reloadData()
   }

   func save() {
	let datahandler = DataHandler()
	let shoppingList = datahandler.createShoppingList(title: self.listTitle)
	items.forEach { descr in
		shoppingList.addToItems(datahandler.createShoppingItem(description: descr))
	}
	   DataStorageHandler().save(shoppingList)
   }
}
