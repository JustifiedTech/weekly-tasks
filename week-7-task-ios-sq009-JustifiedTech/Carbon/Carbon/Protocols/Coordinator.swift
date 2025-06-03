//
//  MainCoordinator.swift
//  Carbon
//
//  Created by Kelechi Brian on 11/27/21.
//

import UIKit

protocol Coordinator{
    var navigationController: UINavigationController? {get set}
    var children: [Coordinator]? {get set}
    
    func eventOccurred(with type: Event, user:Int)
    func start()
}
