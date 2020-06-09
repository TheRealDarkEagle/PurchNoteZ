//
//  VC_Extension_Setup.swift
//  PurchNotezV2
//
//  Created by Baur Versand on 09.06.20.
//  Copyright © 2020 Empiriecom. All rights reserved.
//

import UIKit

extension SelectedListViewVC {
	
	override func viewDidLoad() {
        super.viewDidLoad()
		setup()
    }
	
	private func setup() {
		collectionView.register(ShoppingListCellViewModel.self, forCellWithReuseIdentifier: reuseIdentifier)
		collectionView.delegate 		= self
		collectionView.dataSource 		= self
		collectionView.backgroundColor 	= .white
		guard let shoppingTitle = shoppinglist?.title else { return }
        title = shoppingTitle
	}
	
}
