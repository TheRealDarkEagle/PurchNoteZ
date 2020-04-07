//
//  MainVC.swift
//  PurchNotezV2
//
//  Created by Baur Versand on 30.03.20.
//  Copyright © 2020 Empiriecom. All rights reserved.
//

import UIKit
import Foundation

class MainViewController: UIViewController,UICollectionViewDataSource, UICollectionViewDelegate{
    
    @IBOutlet weak var collectionView: UICollectionView!
    private var shoppinglists = [ShoppingList]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupScreen()
    }


    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        shoppinglists.count
    }
       
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "shoppinglistItemCell", for: indexPath) as! shoppinglistItemCell
        cell.titelLabel.text = shoppinglists[indexPath.item].title
        cell.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:))))
        return cell
    }

    
    private func setupScreen(){
        loadShoppingList()
        collectionView.reloadData()
    }
    private func loadShoppingList(){
       shoppinglists = SaveAndRead().loadAll()
    }
    
    @IBAction func handleTap(_ gesture: UITapGestureRecognizer){
        print("tabbed!")
       var cell = gesture.view as? shoppinglistItemCell
        print(cell?.titelLabel.text)
    }
}
