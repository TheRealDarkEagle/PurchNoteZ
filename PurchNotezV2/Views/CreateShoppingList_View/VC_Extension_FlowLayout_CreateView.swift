//
//  VC_Extension_DataSource.swift
//  PurchNotezV2
//
//  Created by Baur Versand on 09.06.20.
//  Copyright © 2020 Empiriecom. All rights reserved.
//

import UIKit

extension CreateShoppingListVC: UICollectionViewDelegateFlowLayout {
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		CGSize(width: 100, height: 100)
	}
}
