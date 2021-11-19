//
//  FavouritePetCollectionViewCell.swift
//  Pets
//
//  Created by Decagon on 11/13/21.
//

import UIKit

class FavouritePetCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var favouriteDogImage: UIImageView!
    
    @IBOutlet weak var favouriteDogname: UILabel!
    
    @IBOutlet weak var isFavouriteImage: UIImageView!
    
    func configure(with petData: DogModel) {
        updateUI(name: petData.name, image: petData.image, isFave:  "heart.fill")
    }
    
    private func updateUI(name:String?, image:String?, isFave:String){
        self.isFavouriteImage.image = UIImage(systemName: isFave)
        self.favouriteDogname.text = name
        
        guard let dogImagestring = image else {return}
        
        guard let dogImageUrl = URL(string: dogImagestring) else {
            self.favouriteDogImage.image = UIImage(imageLiteralResourceName: "dog")
            return
        }
        
        self.favouriteDogImage.image = nil
        
        NetworkService().getImageDataFrom(url: dogImageUrl, imageCell:self.favouriteDogImage)
        
    }
}
