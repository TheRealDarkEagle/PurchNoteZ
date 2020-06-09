//
//  VC_Extension_.swift
//  PurchNotezV2
//
//  Created by Baur Versand on 09.06.20.
//  Copyright © 2020 Empiriecom. All rights reserved.
//

import UIKit

extension StartViewVC {
	
		func reloadData() {
			shoppingLists = dataStorageHandler.loadAll()
			tableView.reloadData()
		}

		@IBAction func clearList(_ sender: Any) {
			dataStorageHandler.clearList()
			setupScreen()
		}
	}
