//
//  CreateVC.swift
//  PurchNotezV2
//
//  Created by Baur Versand on 30.03.20.
//  Copyright © 2020 Empiriecom. All rights reserved.
//
import UIKit
import Foundation

class CreateViewController: UICollectionViewController{
    
    private lazy var shoppinglist: ShoppingList  = {
        var sp = ShoppingList()
        let date = Date().fullStringRepresentation
        sp.title = date
        return sp
    }()

   
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func addItem(_ sender: Any) {
        let ac = UIAlertController(title: "Was benötigst du noch?", message: nil, preferredStyle: .alert)
        ac.addTextField()
        
        let submitAction = UIAlertAction(title: "Hinzufügen", style: .default){
            [weak self, weak ac] _ in guard let txt = ac?.textFields?[0].text else { return }
            self?.createShoppingItem(txt)
        }
        ac.addAction(submitAction)
        self.present(ac, animated: true)
    }
    
    func createShoppingItem(_ txt: String){
        if txt.isEmpty{
            return
        }
        let item = Item(description: txt)
        shoppinglist.items.append(item)
        reloadCollection()
    }
    
    func reloadCollection(){
        collectionView.reloadData()
    }

    func save() {
        SaveAndRead().save(shoppinglist)
        print("saved")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        save()
    }
    
    @IBAction func changeShoppinglistTitle(_ sender: Any) {
        let ac = UIAlertController(title: "Neuer Title", message: nil, preferredStyle: .alert)
               ac.addTextField()
               
               let submitAction = UIAlertAction(title: "Bestätigen", style: .default){
                [weak self, weak ac] _ in guard let txt = ac?.textFields?[0].text else { return }
                self?.shoppinglist.title = txt
               }
        
               ac.addAction(submitAction)
               self.present(ac, animated: true)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        shoppinglist.items.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "itemCell", for: indexPath) as! CustomCollectionViewCell
        
        cell.setTitle(shoppinglist.items[indexPath.item].getTitle())
        cell.setDescription(shoppinglist.items[indexPath.item].description)
        return cell
    }
}

extension Date {
    var fullStringRepresentation: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "mm.hh.dd.MM.yyyy"
        return formatter.string(from: self)
    }
}
