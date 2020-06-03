//
//  SLCollectionViewController.swift
//  PurchNotezV2
//
//  Created by Baur Versand on 07.04.20.
//  Copyright © 2020 Empiriecom. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class PNCollectionViewController: NSObject, UICollectionViewDataSource, UICollectionViewDelegate {

    var shoppinglist: ShoppingList?
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
          
        guard shoppinglist != nil else { return 0 }
        return shoppinglist!.items.count
      }
      
      func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if shoppinglist != nil {
			guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "itemCell", for: indexPath) as? CustomCollectionViewCell else { return UICollectionViewCell() }
            
            //cell.titleLabel.text = shoppinglist!.items[indexPath.item].getTitle()
            //cell.descritonLabel.text = shoppinglist!.items[indexPath.item].description
            
            return cell
        } else {
            return UICollectionViewCell()
            
        }
          
      }
   
}
