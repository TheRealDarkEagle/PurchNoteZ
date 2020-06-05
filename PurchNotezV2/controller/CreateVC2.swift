import UIKit
import Foundation
import SnapKit

private let cellIdentifier = "itemCell"

class CreateViewController: UICollectionViewController {
	
    private lazy var shoppinglist: ShoppingItemList  = {
		var shoppinglist = ShoppingItemList(context: DataHandler().managedObjectContext)
        let date = Date().fullStringRepresentation
        shoppinglist.title = date
        return shoppinglist
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
		setup()
		requestTitle()
    }
	
	// MARK: - Setup Functions
	
	private func setup() {
		collectionView.backgroundColor = .white
		collectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: cellIdentifier)
		collectionView.delegate = self
		collectionView.dataSource = self
		
		setupNavigationBarItems()
	}
	
	private func setupNavigationBarItems() {
		self.navigationController?.setToolbarHidden(false, animated: false)
		self.navigationController?.toolbar.isUserInteractionEnabled = true
		
		self.setToolbarItems([UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(segueToMainScreen))], animated: true)
		navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(newItem))
	}
	
	// MARK: - Segue
	
	@objc func segueToMainScreen() {
		save()
		self.navigationController?.popViewController(animated: true)
	}
	
	// MARK: - CollectionView Functions
	
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		guard let items = shoppinglist.items else { return 0 }
		return items.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as? CustomCollectionViewCell {
			guard let item = shoppinglist.items?.array[indexPath.row] as? ShoppingItem else { return UICollectionViewCell() }
			guard let itemText = item.text else { return UICollectionViewCell() }
			cell.title = itemText.convertToEmoji()
			cell.descriptionText = item.text
			cell.backgroundColor = .systemGray5
			return cell
		}
			return UICollectionViewCell()
    }
   
}

	// MARK: - CollectionViewDelegateFlowLayout

extension CreateViewController: UICollectionViewDelegateFlowLayout {
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		CGSize(width: 100, height: 100)
	}
}

	// MARK: - Utility Functionality

extension CreateViewController {
    private func requestTitle() {
           let alertController = UIAlertController(title: "Titel eingeben", message: "Bitte bennene deinen Einkaufszettel", preferredStyle: .alert)
           alertController.addTextField()
           let alertAction = UIAlertAction(title: "OK", style: .default) { [weak self, weak alertController] _ in
               guard let txt = alertController?.textFields?[0].text else { return }
               if txt.isEmpty {
                   return
               }
               self?.shoppinglist.title = txt
               self?.title = self?.shoppinglist.title
               
           }
           alertController.addAction(alertAction)
           self.present(alertController, animated: true)
       }
	
	@objc func newItem() {
		addItem()
	}

	func addItem() {
           let alertController = UIAlertController(title: "Was benötigst du noch?", message: nil, preferredStyle: .alert)
           alertController.addTextField()
           
           let submitAction = UIAlertAction(title: "Hinzufügen", style: .default) { [weak self, weak alertController] _ in guard let txt = alertController?.textFields?[0].text else { return }
               self?.createShoppingItem(txt)
           }
           alertController.addAction(submitAction)
           self.present(alertController, animated: true)
   }
       
       func createShoppingItem(_ txt: String) {
           if txt.isEmpty {
               return
           }
			let item = ShoppingItem(context: DataHandler().managedObjectContext)
			print(txt)
			item.text = txt
			item.checked = false
			
			shoppinglist.addToItems(item)
			reloadCollection()
       }
       
       func reloadCollection() {
           collectionView.reloadData()
       }

       func save() {
           DataStorageHandler().save(shoppinglist)
       }
}
