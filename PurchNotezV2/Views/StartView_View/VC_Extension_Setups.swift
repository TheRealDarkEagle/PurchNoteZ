//
//  VC_Extension_Setups.swift
//  PurchNotezV2
//
//  Created by Baur Versand on 09.06.20.
//  Copyright © 2020 Empiriecom. All rights reserved.
//

import Foundation
import UIKit

extension StartViewVC {
	
	override func viewDidLoad() {
        super.viewDidLoad()
		setup()
	}
	
	override func viewWillAppear(_ animated: Bool) {
		reloadData()
	}
	
	// MARK: - Setup Functions
	
	private func setup() {
		view.backgroundColor = .white
		setupTableView()
        setupScreen()
	}
	
	private func setupTableView() {
		tableView.register(ShoppinglistItemCell.self, forCellReuseIdentifier: cellIdentifier)
		tableView.dataSource = self
		tableView.delegate = self
		tableView.isUserInteractionEnabled = true
		tableView.allowsSelection = true
		view.addSubview(tableView)
		
		tableView.snp.makeConstraints { (make) in
			make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading)
			make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing)
			make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
			make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
		}
	}
	
	func setupScreen() {
		setupNavigationItems()
        reloadData()
    }
	
	private func setupNavigationItems() {
		navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(segueToCreateScreen))
	}

}
