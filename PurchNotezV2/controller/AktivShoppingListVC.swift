//
//  AktivShoppingListVX.swift
//  PurchNotezV2
//
//  Created by Baur Versand on 06.05.20.
//  Copyright © 2020 Empiriecom. All rights reserved.
//

import UIKit

private let reuseIdentifier = "itemCell"

class AktivShoppingListVC: UICollectionViewController {
    
    var shoppinglist: ShoppingItemList?
    
    override func viewDidLoad() {
        super.viewDidLoad()
		setup()
    }
	
	private func setup() {
		collectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
		collectionView.delegate 		= self
		collectionView.dataSource 		= self
		collectionView.backgroundColor 	= .white
        title = shoppinglist?.title
	}
	
	// MARK: - CollectionView Functions
	
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		guard let numberOfItems = shoppinglist?.items?.count else { return 0 }
		return numberOfItems
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? CustomCollectionViewCell else { return UICollectionViewCell() }
		guard let items = shoppinglist?.items 					else { return UICollectionViewCell() }
		guard let item = items[indexPath.row] as? ShoppingItem 	else { return UICollectionViewCell() }
		
		cell.title = item.text?.lowercased().convertToEmoji()
		cell.descriptionText = item.text
        
		if item.checked {
            cell.backgroundColor = .green
        } else {
            cell.backgroundColor = .systemGray6
        }
		
		return cell
    }
	
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let shoppinglist = shoppinglist  else { return }
		guard let item = shoppinglist.items?[indexPath.row] as? ShoppingItem else { return }
		
        item.checked = !item.checked
        self.collectionView.reloadData()
    }
}

extension AktivShoppingListVC: UICollectionViewDelegateFlowLayout {
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		CGSize(width: 100, height: 100)
	}
}
