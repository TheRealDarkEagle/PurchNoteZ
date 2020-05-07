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
        
        cell.titleLabel.text = shoppinglist?.items[indexPath.row].getTitle()
        cell.descritonLabel.text = shoppinglist?.items[indexPath.row].description
        
        return cell
    }

}
