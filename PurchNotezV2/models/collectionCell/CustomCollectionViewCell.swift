//
//  CustomCollectionViewCell.swift
//  PurchNotezV2
//
//  Created by Baur Versand on 01.04.20.
//  Copyright © 2020 Empiriecom. All rights reserved.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var titleLabel : UILabel!
    @IBOutlet weak var descritonLabel: UILabel!
    
    func setTitle(_ txt: String){
        titleLabel.text = txt
    }
    func setDescription(_ txt: String){
        descritonLabel.text = txt
    }

}
