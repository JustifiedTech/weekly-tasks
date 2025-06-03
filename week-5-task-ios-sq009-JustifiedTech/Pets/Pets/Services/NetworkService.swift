//
//  NetworkService.swift
//  Pets
//
//  Created by Decagon on 11/13/21.
//

import UIKit

class NetworkService {
    
    private var dataTask: URLSessionDataTask?
    
    func getPetData(completion: @escaping (Result<Dog, Error>) ->  Void) {
        let petUrl = "https://api.thedogapi.com/v1/breeds?api_key=18a58d9f-0669-4568-bf36-1f37914bdc57"
        
        guard let url = URL(string: petUrl) else {return}
        dataTask = URLSession.shared.dataTask(with: url)  { (data:Data?, response:URLResponse?, error:Error?) in
            if let error = error {
                completion(Result.failure(error))
                print("DataTask error: \(error.localizedDescription)")
                return
            }
            guard let response = response as? HTTPURLResponse else {
                print("empyty respnse")
                return
            }
            print("Response status code: \(response.statusCode)")
            guard let data = data else {
                print("empty data")
                return
            }
            do {
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(Dog.self, from: data)
                DispatchQueue.main.async {
                    completion(Result.success(jsonData))
                }
            }
            catch let error {
                completion(.failure(error))
            }
        }
        
        dataTask?.resume()
        
    }
    
    func getImageDataFrom(url: URL, imageCell:UIImageView){
        URLSession.shared.dataTask(with: url) {(data, response, error) in
            if let error = error {
                print("image error \(error.localizedDescription)")
                return
            }
            guard let data = data else {
                print("no data found")
                return
            }
            DispatchQueue.main.async {
                if let img = UIImage(data: data) {
                    imageCell.image = img
                }
            }
        }.resume()
        
    }
}
