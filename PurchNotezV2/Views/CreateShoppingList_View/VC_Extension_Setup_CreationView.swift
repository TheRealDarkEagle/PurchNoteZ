//
//  VC_Extension_Setup_CreationView.swift
//  PurchNotezV2
//
//  Created by Baur Versand on 09.06.20.
//  Copyright © 2020 Empiriecom. All rights reserved.
//

import UIKit

extension CreateShoppingListVC {
	
	override func viewDidLoad() {
        super.viewDidLoad()
		requestTitle()
		setup()
		
    }
	
	// MARK: - Setup Functions
	
	private func setup() {
		collectionView.backgroundColor = .white
		collectionView.register(ShoppingListCellViewModel.self, forCellWithReuseIdentifier: cellIdentifier)
		collectionView.delegate = self
		collectionView.dataSource = self
		
		setupNavigationBarItems()
	}
	
	private func setupNavigationBarItems() {
		navigationController?.setToolbarHidden(false, animated: false)
		navigationController?.toolbar.isUserInteractionEnabled = true
		
		setToolbarItems([UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(segueToMainScreen))], animated: true)
		navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(newItem))
	}
	
}
