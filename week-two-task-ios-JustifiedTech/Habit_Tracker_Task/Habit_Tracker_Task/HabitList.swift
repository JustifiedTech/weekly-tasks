//
//  HabitList.swift
//  Habit_Tracker_Task
//
//  Created by Decagon on 10/27/21.
//

import UIKit

// MARK:- Reusable SFSymbol Images
enum HabitSymbol {
    case leading
  case trailing
  case checked
//  case letterSquare(letter: Character?)
  
  var image: UIImage {
    let imageName: String
    switch self {
    case .leading, .checked:
      imageName = "circle"
    case .trailing:
      imageName = "self"
    
  }
      return UIImage(systemName: imageName)!
}
}


// MARK:- Habits
    enum HabitList {
  static let newHabit: [Habits] = [
    Habits(leadingImage:"circle", traillingImage:"aqi.medium", habit: "0/1 time", habitTime:"Meditation"),
    Habits(leadingImage:"circle", traillingImage:"aqi.medium", habit:"0/1 time", habitTime:"Set to-do list"),
    Habits(leadingImage:"circle", traillingImage:"aqi.medium", habit:"0/1 time", habitTime:"Drink Water"),
    Habits(leadingImage:"circle", traillingImage:"aqi.medium", habit:"0/1 time", habitTime: "Running"),
    Habits(leadingImage:"checkmark.circle", traillingImage:"aqi.medium", habit: "0/1 time", habitTime: "Read Books"),
    ]
           
}
