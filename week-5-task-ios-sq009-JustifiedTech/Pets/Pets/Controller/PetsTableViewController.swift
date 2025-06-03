//
//  PetsTableViewController.swift
//  Pets
//
//  Created by Decagon on 11/12/21.
//

import UIKit

final class PetsTableViewController: UITableViewController {
    
    var reload:ReloadView?
    private var networkService = NetworkService()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        if let favouritePetViewController  = self.tabBarController?.viewControllers?.last as? FavouritePetCollectionViewController {
            favouritePetViewController.reload = self
        }
        loadDataOnStart()
        refreshControl?.addTarget(self, action: #selector(refresh), for: .valueChanged)
        
    }
    
    private func loadDataOnStart(){
        self.getDogPetData { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()  
            }
        }
    }
    
    @objc func refresh(send:UIRefreshControl){
        self.getDogPetData { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
                self?.refreshControl?.endRefreshing()
                
            }
        }
    }
    
    private func getDogPetData(completion: @escaping () -> Void ) {
        networkService.getPetData(completion: { [weak self](response:Result<Dog, Error>) in
            switch response {
            case .success(let data):
                DogBreedData.dogBreedData.populateData(dog: data)
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            case .failure(let error):
                print ("error processing json data \(error)")
            }
        })
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        guard let count = DogBreedData.dogBreedData.dogBreed?.count else {return 0}
        return count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let petCell = tableView.dequeueReusableCell(withIdentifier: "PetCell", for: indexPath)
        
        
        guard let petTableViewCell = petCell as? PetTableViewCell,
              let petElement = DogBreedData.dogBreedData.dogBreed?[indexPath.row]
                
        else {
            return UITableViewCell ()
        }
        
        petTableViewCell.configure(with: petElement)
        return petTableViewCell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "All Dogs"
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        DogBreedData.dogBreedData.updateFavouriteDog(at: indexPath.row)
        tableView.reloadData()
        reloadCollectionController()
        
    }
    
    func reloadCollectionController() {
        reload?.reloadView()
    }
    
}

extension PetsTableViewController:ReloadView{
    func reloadView() {
        tableView.reloadData()
    }
    
    
}
