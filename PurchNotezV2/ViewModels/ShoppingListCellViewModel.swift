//
//  CustomCollectionViewCell.swift
//  PurchNotezV2
//
//  Created by Baur Versand on 01.04.20.
//  Copyright © 2020 Empiriecom. All rights reserved.
//

import UIKit
import SnapKit

class ShoppingListCellViewModel: UICollectionViewCell {
	
	// MARK: - Properties
	
	var title: String? {
		didSet {
			guard let title = title else { return }
			titleLabel.text = title
		}
	}
	
	var descriptionText: String? {
		didSet {
			guard let descriptionText = descriptionText else { return }
			descriptionLabel.text = descriptionText
		}
	}
	
	let titleLabel: UILabel = {
		let label = UILabel()
		label.text = ""
		label.translatesAutoresizingMaskIntoConstraints = false
		label.textAlignment = .center
		label.font = label.font.withSize(50)
		return label
	}()
	let descriptionLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.textAlignment = .center
		label.text = ""
		return label
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		backgroundColor = .cyan
		setupCell()
	}
	
	// MARK: - Building the Cell
	
	private func setupCell() {
		self.translatesAutoresizingMaskIntoConstraints = false
		addSubview(titleLabel)
		addSubview(descriptionLabel)
		
		titleLabel.snp.makeConstraints { (make) in
			make.leading.equalTo(self.snp.leading)
			make.trailing.equalTo(self.snp.trailing)
			make.top.equalTo(self.snp.top)
			make.height.equalTo(80)
		}
		descriptionLabel.snp.makeConstraints { (make) in
			make.top.equalTo(titleLabel.snp.bottom)
			make.leading.equalTo(self.snp.leading)
			make.trailing.equalTo(self.snp.trailing)
			make.bottom.equalTo(self.snp.bottom)
		}
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
