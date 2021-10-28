//
//  ViewController.swift
//  Habit_Tracker_Task
//
//  Created by Decagon on 10/25/21.
//

// Please you might find a HabitViewController in among the files but I cou

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var customTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
//        customTable.dataSource = self
        
       
    }
    
    let newHabits: [Habits] = [
        Habits(leadingImage:"circle", traillingImage:"aqi.medium", habit: "0/1 time", habitTime:"Meditation"),
        Habits(leadingImage:"circle", traillingImage:"list.star", habit:"0/1 time", habitTime:"Set to-do list"),
        Habits(leadingImage:"circle", traillingImage:"drop", habit:"0/1 time", habitTime:"Drink Water"),
        Habits(leadingImage:"circle", traillingImage:"figure.walk", habit:"0/1 time", habitTime: "Running"),
        Habits(leadingImage:"checkmark.circle", traillingImage:"book", habit: "0/1 time", habitTime: "Read Books"),
        ]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newHabits.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "\(HabitCell.self)", for:  indexPath as IndexPath) as? HabitCell
                
        else {
            fatalError("Could not create cell")
        }
        let eachHabit = newHabits[indexPath.row]
        cell.habitLabel.text = eachHabit.habit
        cell.habitTimeLabel.text = eachHabit.habitTime
        cell.leadingIcon.image = UIImage(systemName: eachHabit.leadingImage)
        cell.trailingIcon.image = UIImage(systemName: eachHabit.traillingImage)
        
    
        return cell
    }
    
    
    @IBAction func showAlert(){
        let message = "Alert was clicked"
        
        let alert = UIAlertController(title: "Popup Alert", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Close", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: {
            print("Successfully completed")
        })
        
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


