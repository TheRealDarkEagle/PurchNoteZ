//
//  MainVC.swift
//  PurchNotezV2
//
//  Created by Baur Versand on 30.03.20.
//  Copyright © 2020 Empiriecom. All rights reserved.
//

import UIKit
import SnapKit

class StartViewVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

	var tableView = UITableView()
	let dataStorageHandler = DataStorageHandler()
    var selectedShoppingList: ShoppingItemList?
	var shoppingLists: [ShoppingItemList]?
	let cellIdentifier = "shoppingList"
	
	// MARK: - TableView Functions
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		guard let lists = shoppingLists else { return 0 }
        return lists.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
		guard let lists = shoppingLists else { return UITableViewCell() }
        cell.textLabel?.text = lists[indexPath.item].title
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		if tableView.cellForRow(at: indexPath)?.textLabel?.text != nil {
			guard let lists = shoppingLists else { return }
			let activelist = lists[indexPath.row]
			segueToAktiveShoppingList(list: activelist)
           }
    }
	
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let actionDelete = UIContextualAction(style: .normal, title: "Delete", handler: { _, _, _ in
			self.dataStorageHandler.delete(entry: self.dataStorageHandler.loadAll()[indexPath.row])
			self.reloadData()
        })
        actionDelete.backgroundColor = .red
        
        let configuration = UISwipeActionsConfiguration(actions: [actionDelete])
        return configuration
    }
    
}
