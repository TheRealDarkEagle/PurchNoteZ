import UIKit
import Foundation

private let cellIdentifier = "itemCell"
	
	// MARK: - CreateViewController Mainpart

class CreateViewController: UICollectionViewController {
    private lazy var shoppinglist: ShoppingList  = {
        var shoppinglist = ShoppingList()
        let date = Date().fullStringRepresentation
        shoppinglist.title = date
        return shoppinglist
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
		setup()
		requestTitle()
    }
	
	@objc func segueToMainScreen() {
		save()
		self.navigationController?.popViewController(animated: true)
	}
	
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
		navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(segueToCreateScreen))
	}
	
	@objc func segueToCreateScreen() {
		addItem()
	}

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        shoppinglist.items.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as? CustomCollectionViewCell {
			cell.title = shoppinglist.items[indexPath.item].title()
			cell.descriptionText = shoppinglist.items[indexPath.item].description
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
           let item = Item(description: txt, checked: false)
           shoppinglist.items.append(item)
           reloadCollection()
       }
       
       func reloadCollection() {
           collectionView.reloadData()
       }

       func save() {
           DataStorageHandler().save(shoppinglist)
       }
       /*
       override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           save()
       }
		*/
       
    @IBAction func changeShoppinglistTitle(_ sender: Any) {
        let alertController = UIAlertController(title: "Neuer Title", message: nil, preferredStyle: .alert)
        alertController.addTextField()
                  
        let submitAction = UIAlertAction(title: "Bestätigen", style: .default) { [weak self, weak alertController] _ in
            guard let txt = alertController?.textFields?[0].text
                else {
                    return
                }
           self?.shoppinglist.title = txt
        }

        alertController.addAction(submitAction)
        self.present(alertController, animated: true)
   }
}
