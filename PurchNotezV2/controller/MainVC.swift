//
//  MainVC.swift
//  PurchNotezV2
//
//  Created by Baur Versand on 30.03.20.
//  Copyright © 2020 Empiriecom. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    var selectedShoppingList :ShoppingItemList?
    @IBOutlet weak var tableView: UITableView!
    private let dataStorageHandler = DataStorageHandler()
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataStorageHandler.loadAll().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "shoppingList", for: indexPath)
        cell.textLabel?.text = dataStorageHandler.loadAll()[indexPath.item].title
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       // if let test = tableView.indexPathsForSelectedRows {
       // }
        if let title = tableView.cellForRow(at: indexPath)?.textLabel?.text{
            let selected = dataStorageHandler.loadAll()[indexPath.row]
            self.selectedShoppingList = selected
            performSegue(withIdentifier: "activateSegue", sender: self)
            print("The selected list is -> \(selected)")
        }
    }
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let actionDelete = UIContextualAction(style: .normal,
                                            title:  "Delete",handler: {_,_,_ in
                                                
                                                self.dataStorageHandler.delete(entry: self.dataStorageHandler.loadAll()[indexPath.row])
                                                tableView.reloadData()
        })
        actionDelete.backgroundColor = .red
        
        
        let configuration = UISwipeActionsConfiguration(actions: [actionDelete])
        return configuration
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupScreen()
    }
    
    private func setupScreen(){
        reloadData()
    }

    private func reloadData(){
         self.tableView.reloadData()
    }
    @IBAction func clearList(_ sender: Any) {
        dataStorageHandler.clearList()
        setupScreen()
    }
    
    @IBAction func unwindToStartScreenController(_ unwindSegue: UIStoryboardSegue) {
        setupScreen()
    }
}


extension MainViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "activateSegue"){
            let t = segue.destination as! AktivShoppingListVC
           // let c = sender as! ShoppingItemList
            t.shoppinglist = self.selectedShoppingList
        }
    }

}
