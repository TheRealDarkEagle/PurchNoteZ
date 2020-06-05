//
//  MainVC.swift
//  PurchNotezV2
//
//  Created by Baur Versand on 30.03.20.
//  Copyright © 2020 Empiriecom. All rights reserved.
//

import UIKit
import SnapKit

private let cellIdentifier = "shoppingList"

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
	
	private let dataStorageHandler = DataStorageHandler()
    var selectedShoppingList: ShoppingItemList?
	var tableView = UITableView()
	var shoppingLists: [ShoppingItemList]?
    
	override func viewDidLoad() {
        super.viewDidLoad()
		setup()
	}
	
	override func viewWillAppear(_ animated: Bool) {
		reloadData()
	}
	
	// MARK: - Setup Functions
	
	private func setup() {
		view.backgroundColor = .white
		setupTableView()
        setupScreen()
	}
	
	private func setupTableView() {
		tableView.register(ShoppinglistItemCell.self, forCellReuseIdentifier: cellIdentifier)
		tableView.dataSource = self
		tableView.delegate = self
		tableView.isUserInteractionEnabled = true
		tableView.allowsSelection = true
		view.addSubview(tableView)
		
		tableView.snp.makeConstraints { (make) in
			make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading)
			make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing)
			make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
			make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
		}
	}
	
	private func setupScreen() {
		setupNavigationItems()
        reloadData()
    }
	
	private func setupNavigationItems() {
		navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(segueToCreateScreen))
	}
	
	// MARK: - Segues

	@objc func segueToCreateScreen() {
		let creationScreen = CreateViewController(collectionViewLayout: UICollectionViewFlowLayout())
		navigationController?.pushViewController(creationScreen, animated: true)
	}
	
	private func segueToAktiveShoppingList(list: ShoppingItemList) {
		let aktiveShoppingListVC = AktivShoppingListVC(collectionViewLayout: UICollectionViewFlowLayout())
		aktiveShoppingListVC.shoppinglist = list
		navigationController?.pushViewController(aktiveShoppingListVC, animated: true)
	}
	
	// MARK: - TableView Functions
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		guard let lists = shoppingLists else { return 0 }
        return lists.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "shoppingList", for: indexPath)
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
    
    // MARK: - Util´s Functions

    private func reloadData() {
		shoppingLists = dataStorageHandler.loadAll()
		tableView.reloadData()
    }

    @IBAction func clearList(_ sender: Any) {
        dataStorageHandler.clearList()
        setupScreen()
    }
}
