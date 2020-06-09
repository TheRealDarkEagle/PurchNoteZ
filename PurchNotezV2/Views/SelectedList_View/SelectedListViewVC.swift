//
//  AktivShoppingListVX.swift
//  PurchNotezV2
//
//  Created by Baur Versand on 06.05.20.
//  Copyright © 2020 Empiriecom. All rights reserved.
//

import UIKit

class SelectedListViewVC: UICollectionViewController {
    
    var shoppinglist: ShoppingItemList?
	let reuseIdentifier = "itemCell"
	
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		guard let numberOfItems = shoppinglist?.items?.count else { return 0 }
		return numberOfItems
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? ShoppingListCellViewModel else { return UICollectionViewCell() }
		guard let item = shoppinglist?.items?[indexPath.row] as? ShoppingItem else { return cell }

		let viewModel = ItemViewModel(shoppingItem: item)

		cell.title = viewModel.title
		cell.descriptionText = viewModel.description
		cell.backgroundColor = viewModel.backgroundColor
		
		return cell
    }
	
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let shoppinglist = shoppinglist  else { return }
		guard let item = shoppinglist.items?[indexPath.row] as? ShoppingItem else { return }
		
        item.checked = !item.checked
        self.collectionView.reloadData()
    }
}
