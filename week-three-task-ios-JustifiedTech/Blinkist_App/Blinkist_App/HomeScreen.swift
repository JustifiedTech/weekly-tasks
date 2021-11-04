//
//  HomeScreen.swift
//  Blinkist_App
//
//  Created by Decagon on 10/28/21.
//

import UIKit

class HomeScreen: UIViewController {
    
    
    var bookData:[Book] = []
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        title="Home"
        
        bookData = BooKJsonData().bookJsonData
        
        
    }
    
    
}

extension HomeScreen: UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerSection = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "BookCellHeader", for: indexPath)
        
        
        return headerSection
        
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return bookData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
//        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BookCell", for: indexPath as IndexPath) as? BookCollectionViewCell else{
//            fatalError("unable to create cell")
//        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! BookCollectionViewCell
        
                let eachBook = bookData[indexPath.row]
                cell.bookTitle.text = eachBook.title
                cell.bookAuthor.text = eachBook.author
        cell.bookDesc.text = "\(eachBook.book_type) - \(eachBook.length/60)h \(eachBook.length%60)min"
        
        
                cell.bookImage.image = UIImage(systemName: "book")
                cell.bookLock.image = UIImage(systemName: eachBook.access == "locked" ? "lock":"" )
                cell.bookImage.image = UIImage(imageLiteralResourceName: eachBook.image)
        
        
        return cell;
        
    }
    
    
    
    
    
}

extension HomeScreen:UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        vc.bookId = bookData[indexPath.row].id
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
