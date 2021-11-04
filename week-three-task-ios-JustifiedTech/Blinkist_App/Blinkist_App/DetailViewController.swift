//
//  DetailViewController.swift
//  Blinkist_App
//
//  Created by Decagon on 10/31/21.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var bookAuthor: UILabel!
    @IBOutlet weak var bookTitle: UILabel!
    @IBOutlet weak var bookDescription: UITextView!
    
    @IBOutlet weak var bookImage: UIImageView!
    @IBOutlet weak var bookLength: UILabel!

    
    var bookId = 0;
    
    var bookData:[Book] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        bookData = BooKJsonData().bookJsonData

        
        if let book = findBook(value: bookId, in: bookData) {
            bookAuthor.text = book.author
            bookTitle.text = book.title
            bookDescription.text = book.description
            bookLength.text = "\(book.length/60)h \(book.length%60)min"
            bookImage.image = UIImage(imageLiteralResourceName: book.image)
            
        }
        

        // Do any additional setup after loading the view.
        print("view loaded")
    }
    
    override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    }
    
   
    
    func findBook(value id: Int, in array: [Book]) -> Book? {
        for (_, value) in array.enumerated()
        {
            if value.id == id {
                return value
            }
        }

        return nil
    }
    


}
