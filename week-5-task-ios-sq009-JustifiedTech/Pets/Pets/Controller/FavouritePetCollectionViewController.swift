//
//  FavouritePetCollectionViewController.swift
//  Pets
//
//  Created by Decagon on 11/13/21.
//

import UIKit

private let reuseIdentifier = "favouritePetCell"

class FavouritePetCollectionViewController: UICollectionViewController {
    
    var reload:ReloadView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("");
        if let favouritePetViewController  = self.tabBarController?.viewControllers?.first as? PetsTableViewController {
            favouritePetViewController.reload = self
        }
        
        
    }
    
    
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let favouritePetHeaderCell = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: FavouritePetCellHeader.identifier, for: indexPath)
        
        
        return favouritePetHeaderCell
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let count = DogBreedData.dogBreedData.faveDogBreed?.count else{ return 0}
        return count
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let favouriteDogCell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as?  FavouritePetCollectionViewCell,
              let petElement = DogBreedData.dogBreedData.faveDogBreed?[indexPath.row]
        else{
            return UICollectionViewCell()
        }
        
        favouriteDogCell.configure(with: petElement)
        return favouriteDogCell
    }
    
  
    
    // MARK: UICollectionViewDelegate
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if let id = DogBreedData.dogBreedData.faveDogBreed?[indexPath.row].id{
            
            DogBreedData.dogBreedData.updateFavouriteDog(at: id)
            
            collectionView.reloadData()
            reloadTableController()
        }
    }
    
    func reloadTableController() {
        reload?.reloadView()
    }
    
}

extension FavouritePetCollectionViewController:ReloadView {
    func reloadView() {
        collectionView.reloadData()
    }
}
