//
//  AktivShoppingListVX.swift
//  PurchNotezV2
//
//  Created by Baur Versand on 06.05.20.
//  Copyright © 2020 Empiriecom. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class AktivShoppingListVC: UICollectionViewController {
    
    var shoppinglist : ShoppingList?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = shoppinglist?.title
    }
  
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shoppinglist?.items.count ?? 0
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "itemCell", for: indexPath) as! CustomCollectionViewCell

        guard let item = shoppinglist?.items[indexPath.row] else { return cell }

        
        cell.titleLabel.text = item.getTitle()
        cell.descritonLabel.text = item.description
        
        if(item.checked){
            cell.backgroundColor = .green
        }else{
            cell.backgroundColor = .systemGray6
        }
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        var itemStatus = shoppinglist?.items[indexPath.row].checked
        shoppinglist?.items[indexPath.row].checked = !itemStatus!
        self.collectionView.reloadData()
    }
}
