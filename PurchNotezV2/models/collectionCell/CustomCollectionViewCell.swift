//
//  CustomCollectionViewCell.swift
//  PurchNotezV2
//
//  Created by Baur Versand on 01.04.20.
//  Copyright © 2020 Empiriecom. All rights reserved.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
	
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
		
		NSLayoutConstraint.activate([
			titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
			titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
			titleLabel.topAnchor.constraint(equalTo: topAnchor),
			titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -30),
			descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
			descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
			descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
			descriptionLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
		])
		
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
