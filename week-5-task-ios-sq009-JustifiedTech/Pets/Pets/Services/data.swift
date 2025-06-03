

import UIKit

final class DogBreedData {
    static let dogBreedData = DogBreedData()
    let userDefaults = UserDefaults.standard
    
    
    var dogBreed: [DogModel]?
    var faveDogBreed: [DogModel]?
    private init() {}
    
    func deleteDogFromFave(from dogBreed: DogModel) {
let dogBreedIndex = faveDogBreed?.firstIndex(where: { faveDog in
            faveDog.id == dogBreed.id
      }) 
        if let dogBreedIndex = dogBreedIndex {
            faveDogBreed?.remove(at: dogBreedIndex)
        }
    }
    
    func updateFavouriteDog(at row: Int) {
        let isFavourite:Bool = dogBreed?[row].isFavourite ?? false
        guard let eachDogBreed = dogBreed?[row] else { return }
        eachDogBreed.isFavourite = !isFavourite
        
        let uniqueID = eachDogBreed.id
        
        if isFavourite {
            userDefaults.removeObject(forKey:"Dog\(uniqueID)")
            
            deleteDogFromFave(from: eachDogBreed)
        } else {
            
            userDefaults.set(true, forKey: "Dog\(uniqueID)")
            
            faveDogBreed?.append(eachDogBreed)
        }
    }
    
    
    func populateData(dog: (Dog)) {
        dogBreed = []
        faveDogBreed = []
        for (index, datum) in dog.enumerated() {
            let id = index
            let name = datum.name ?? ""
            let image = datum.image?.url ?? ""
            let isFavourite = userDefaults.bool(forKey: "Dog\(id)")
            
            let dogModel = DogModel(dogId: id, dogName: name, dogImage: image, isDogFavourite: isFavourite)
            
            if isFavourite {
                faveDogBreed?.append(dogModel)
            }
            dogBreed?.append(dogModel)
        }
    }
    
}
