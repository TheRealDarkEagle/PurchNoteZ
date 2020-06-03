//
//  MainVC.swift
//  PurchNotezV2
//
//  Created by Baur Versand on 30.03.20.
//  Copyright © 2020 Empiriecom. All rights reserved.
//

import UIKit

private let cellIdentifier = "shoppingList"

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
	
	private let dataStorageHandler = DataStorageHandler()
    var selectedShoppingList: ShoppingItemList?
	var tableView = UITableView()
	var shoppingLists: [ShoppingItemList]?
    
	override func viewDidLoad() {
		print("Loading MainVC!")
        super.viewDidLoad()
		setupTableView()
        setupScreen()
		view.backgroundColor = .white
	}
	
	override func viewWillAppear(_ animated: Bool) {
		reloadData()
	}
	/*
	Creation-Screen segue
	*/
	@objc func segueToCreateScreen() {
		let creationScreen = CreateViewController(collectionViewLayout: UICollectionViewFlowLayout())
		navigationController?.pushViewController(creationScreen, animated: true)
	}
	
	private func setupTableView() {
		
		tableView.isUserInteractionEnabled = true
		tableView.allowsSelection = true
		
		tableView.register(ShoppinglistItemCell.self, forCellReuseIdentifier: cellIdentifier)
		tableView.dataSource = self
		tableView.delegate = self
		view.addSubview(tableView)
		tableView.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
			tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
			tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
			tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
		])
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		guard let lists = shoppingLists else { return 0}
        return lists.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "shoppingList", for: indexPath)
		guard let lists = shoppingLists else { return UITableViewCell()}
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
        let actionDelete = UIContextualAction(style: .normal,
                                            title: "Delete", handler: {_, _, _ in
                                                
                                                self.dataStorageHandler.delete(entry: self.dataStorageHandler.loadAll()[indexPath.row])
												self.reloadData()
        })
        actionDelete.backgroundColor = .red
        
        let configuration = UISwipeActionsConfiguration(actions: [actionDelete])
        return configuration
    }
	
	private func segueToAktiveShoppingList(list: ShoppingItemList) {
		let aktiveShoppingListVC = AktivShoppingListVC(collectionViewLayout: UICollectionViewFlowLayout())
		aktiveShoppingListVC.shoppinglist = list
		navigationController?.pushViewController(aktiveShoppingListVC, animated: true)
	}
    
    private func setupScreen() {
		setupNavigationItems()
        reloadData()
    }
	
	private func setupNavigationItems() {
		navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(segueToCreateScreen))
	}

    private func reloadData() {
		shoppingLists = dataStorageHandler.loadAll()
		tableView.reloadData()
    }

    @IBAction func clearList(_ sender: Any) {
        dataStorageHandler.clearList()
        setupScreen()
    }
}

extension ShoppingItemList {
    func convertToShoppingList() -> ShoppingList {
        let shoppinglist = ShoppingList()
        shoppinglist.title = self.title!
        if let items = self.items {
          _ = items.array.map { item in
			guard let shoppingItem = item as? ShoppingItem else { return }
			guard let itemText = shoppingItem.text else { return }
			shoppinglist.add(itemText)
            }
        }
        return shoppinglist
    }
}
