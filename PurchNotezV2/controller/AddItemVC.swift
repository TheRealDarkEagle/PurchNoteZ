//
//  AddItemVC.swift
//  PurchNotezV2
//
//  Created by Baur Versand on 30.03.20.
//  Copyright © 2020 Empiriecom. All rights reserved.
//

import UIKit
import Foundation

class AddItemViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var titelLabel: UITextField!
    @IBOutlet weak var itemLabel: UITextField!
    
    
    
    @IBAction func add(_ sender: Any) {
        guard let itemTxt = itemLabel.text else {
            return
        }
        guard let itemTitel = titelLabel.text else {
            return
        }
//        CreateViewController.addItem(Item(description: itemTxt, titel: itemTxt))
    }
    

}
