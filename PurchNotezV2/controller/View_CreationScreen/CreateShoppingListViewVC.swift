import UIKit
import Foundation
import SnapKit

private let cellIdentifier = "itemCell"

class CreateShoppingListVC: UICollectionViewController {
	
    lazy var shoppinglist: ShoppingItemList  = {
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
		collectionView.register(ShoppingListCellViewModel.self, forCellWithReuseIdentifier: cellIdentifier)
		collectionView.delegate = self
		collectionView.dataSource = self
		
		setupNavigationBarItems()
	}
	
	private func setupNavigationBarItems() {
		navigationController?.setToolbarHidden(false, animated: false)
		navigationController?.toolbar.isUserInteractionEnabled = true
		
		setToolbarItems([UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(segueToMainScreen))], animated: true)
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
		if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as? ShoppingListCellViewModel {
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
