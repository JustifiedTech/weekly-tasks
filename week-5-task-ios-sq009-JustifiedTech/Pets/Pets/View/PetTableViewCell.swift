//
//  PetTableViewCell.swift
//  Pets
//
//  Created by Decagon on 11/12/21.
//

import UIKit

class PetTableViewCell: UITableViewCell {
    
    @IBOutlet weak var petName: UILabel!
    @IBOutlet weak var isFavouriteIcon: UIImageView!
    @IBOutlet weak var petImage: UIImageView!
    
    
    
    func configure(with petData: DogModel) {
        updateUI(name: petData.name, image: petData.image, isFave: petData.isFavourite ? "heart.fill" : "heart")
    }
    
    private func updateUI(name:String?, image:String?, isFave:String){
        self.isFavouriteIcon.image = UIImage(systemName: isFave)
        self.petName.text = name
        
        guard let dogImagestring = image else {return}
        
        guard let dogImageUrl = URL(string: dogImagestring) else {
            self.petImage.image = UIImage(imageLiteralResourceName: "dogIcon")
            return
        }
        
        self.petImage.image = nil
        
        NetworkService().getImageDataFrom(url: dogImageUrl, imageCell:self.petImage)
        
    }
    
    
    
}
