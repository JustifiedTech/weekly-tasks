
//
//  ViewController.swift
//  Habit_Tracker_Task
//
//  Created by Decagon on 10/25/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var customTable: UITableView!
    var dummy = ["K", "B", "C", "D"]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
//        customTable.dataSource = self
        
       
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dummy.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "habitCell", for:  indexPath as IndexPath)
        cell.textLabel?.text = dummy[indexPath.row]
        return cell
    }
    

}

//extension ViewController:UITableViewDelegate, UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return dummy.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "titleCell", for:  indexPath as IndexPath)
//        cell.textLabel?.text = dummy[indexPath.row]
//        return cell
//    }
//
//
//}


