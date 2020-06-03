//
//  ShoppingItemView.swift
//  PurchNotezV2
//
//  Created by Baur Versand on 30.03.20.
//  Copyright © 2020 Empiriecom. All rights reserved.
//

import UIKit

class ShoppingItemView: UIViewController {
    
    internal var titel: String = ""
    internal var dscrpt: String = ""
    @IBOutlet weak var titelLabel: UILabel!
    @IBOutlet weak var describtionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("View did load!")
        titelLabel.text = titel
        describtionLabel.text = dscrpt
    }
    
    func setTitle(_ txt: String) {
        titel = txt
    }
    func setDescription(_ txt: String) {
        dscrpt = txt
    }

}
