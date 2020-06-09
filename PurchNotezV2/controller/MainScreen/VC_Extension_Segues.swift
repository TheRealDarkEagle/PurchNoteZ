//
//  VC_Extension_Segues.swift
//  PurchNotezV2
//
//  Created by Baur Versand on 09.06.20.
//  Copyright © 2020 Empiriecom. All rights reserved.
//

import Foundation
import UIKit

extension StartViewVC {
	
	@objc func segueToCreateScreen() {
		let creationScreen = CreateShoppingListVC(collectionViewLayout: UICollectionViewFlowLayout())
		navigationController?.pushViewController(creationScreen, animated: true)
	}
	
	func segueToAktiveShoppingList(list: ShoppingItemList) {
		let aktiveShoppingListVC = SelectedListViewVC(collectionViewLayout: UICollectionViewFlowLayout())
		aktiveShoppingListVC.shoppinglist = list
		navigationController?.pushViewController(aktiveShoppingListVC, animated: true)
	}
	
}
