//
//  BookJsonData.swift
//  Blinkist_App
//
//  Created by Decagon on 10/31/21.
//

import Foundation
public class BooKJsonData {
    @Published var bookJsonData = [Book]()

    init() {
        fetch()
        sort()
    }

    func fetch(){
        if let jsonFile = Bundle.main.url(forResource: "jsonData", withExtension: "json") {
            do {
                let data = try Data(contentsOf:jsonFile)

                let jsonDecoder = JSONDecoder()

                let dataFromJson = try jsonDecoder.decode([Book].self, from: data)
                bookJsonData = dataFromJson
            } catch{
                print(error)
            }
        }
    }
    func sort(){
        bookJsonData = bookJsonData.sorted(by: {
            $0.id < $1.id
        })
    }

}
