//
//  Converter.swift
//  PurchNotezV2
//
//  Created by Baur Versand on 03.06.20.
//  Copyright © 2020 Empiriecom. All rights reserved.
//

import Foundation

extension String {
	func convertToEmoji() -> String {
		Converter().convertToEmoji(text: self.lowercased())
	}
}

class Converter {
	private let map: [String: String] = {
		let dic: [String: String] =
			[
				"apfel": "🍏", "äpfel": "🍎",
				"birne": "🍐", "birnen": "🍐",
				"mandarinen": "🍊", "mandarine": "🍊",
				"zitrone": "🍋", "zitronen": "🍋",
				"banane": "🍌", "bananen": "🍌",
				"wassermelone": "🍉", "wassermelonen": "🍉",
				"traube": "🍇", "trauben": "🍇",
				"erdbeere": "🍓", "erdbeeren": "🍓",
				"melone": "🍈", "melonen": "🍈",
				"kirsche": "🍒", "kirschen": "🍒",
				"pfirsich": "🍑", "pfirsiche": "🍑",
				"mango": "🥭", "mangos": "🥭",
				"ananas": "🍍",
				"kokosnuss": "🥥", "kokosnüsse": "🥥",
				"kiwi": "🥝", "kiwis": "🥝",
				"tomate": "🍅", "tomaten": "🍅",
				"aubergine": "🍆", "auberginen": "🍆",
				"avocado": "🥑", "avocados": "🥑",
				"brokkoli": "🥦",
				"salat": "🥬",
				"gurke": "🥒", "gurken": "🥒",
				"chilli": "🌶", "chillis": "🌶",
				"mais": "🌽",
				"karotte": "🥕", "karotten": "🥕",
				"knoblauch": "🧄",
				"zwiebel": "🧅", "zwiebeln": "🧅",
				"kartoffel": "🥔", "kartoffeln": "🥔",
				"süßkartoffel": "🍠", "süßkartoffeln": "🍠",
				"croissant": "🥐", "croissants": "🥐",
				"bagel": "🥯", "bagels": "🥯",
				"brot": "🍞",
				"baguette": "🥖",
				"brezel": "🥨", "brezeln": "🥨",
				"käse": "🧀",
				"ei": "🥚", "eier": "🥚",
				"butter": "🧈",
				"speck": "🥓",
				"fleisch": "🥩",
				"hänchen": "🍗",
				"pommes": "🍟",
				"burger": "🍔",
				"hotdog": "🌭",
				"pizza": "🍕", "pizzas": "🍕",
				"taco": "🌯", "tacos": "🌯",
				"reis": "🍚",
				"kuchen": "🍰",
				"süßigkeit": "🍬", "süßigkeiten": "🍬",
				"schokolade": "🍫",
				"milch": "🥛",
				"kaffe": "☕️",
				"kekse": "🍪", "keks": "🍪",
				"salz": "🧂",
				"honig": "🍯",
				"nuss": "🥜", "nüsse": "🥜",
				"eis": "🍦", "eiscreme": "🍦"
			]
		
		return dic
	}()
	
	/*
	Returns the corresponding emoji or the first character of the String
	*/
	func convertToEmoji(text: String) -> String {
		if let emoji = map[text] {
			return emoji
		}
		guard let firstChar = text.first else { return "" }
		return "\(firstChar.uppercased())"
	}
}
