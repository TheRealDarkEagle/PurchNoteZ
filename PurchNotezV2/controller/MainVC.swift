//
//  MainVC.swift
//  PurchNotezV2
//
//  Created by Baur Versand on 30.03.20.
//  Copyright © 2020 Empiriecom. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    @IBOutlet weak var tableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        shoppinglists.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "shoppingList", for: indexPath)
        cell.textLabel?.text = shoppinglists[indexPath.item].title
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let title = tableView.cellForRow(at: indexPath)?.textLabel?.text{
            print(title)
        }
    }
    private var shoppinglists = [ShoppingList]()
    
    override func viewDidLoad() {
        print("View did load!")
        super.viewDidLoad()
        setupScreen()
    }
    
    private func setupScreen(){
        loadShoppingList()
        //collectionView.reloadData()
    }
    private func loadShoppingList(){
       shoppinglists = SaveAndRead().loadAll()
        tableView.reloadData()
    }
    
    @IBAction func clearList(_ sender: Any) {
        SaveAndRead().clearList()
        loadShoppingList()
    }
}
