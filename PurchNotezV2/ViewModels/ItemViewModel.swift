//
//  ItemViewModel.swift
//  PurchNotezV2
//
//  Created by Baur Versand on 09.06.20.
//  Copyright © 2020 Empiriecom. All rights reserved.
//

import Foundation
import UIKit

public final class ItemViewModel {
	
	let description: String!
	let title: String
	let backgroundColor: UIColor
	
	public init(shoppingItem: ShoppingItem) {
		
		description = shoppingItem.text
		
		title = String(shoppingItem.text?.lowercased().convertToEmoji() ?? " ")
		if shoppingItem.checked {
			backgroundColor = .green
		} else {
			backgroundColor = .systemGray6
		}
	}
	
}
