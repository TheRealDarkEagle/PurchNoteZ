import UIKit
import SnapKit

class CreateShoppingListVC: UICollectionViewController {
	
	let cellIdentifier = "itemCell"
	var listTitle = ""
	var cellBackgroundColor = UIColor.systemGray6
	var items = [String]()

	// MARK: - Segue
	@objc func segueToMainScreen() {
		save()
		self.navigationController?.popViewController(animated: true)
	}
	
	// MARK: - CollectionView Functions
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return items.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		
		guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as? ShoppingListCellViewModel else { return UICollectionViewCell() }
			
		cell.title = items[indexPath.row].convertToEmoji()
		cell.descriptionText = items[indexPath.row]
		cell.backgroundColor = cellBackgroundColor
		
		return cell
    }
   
}
