//
//  NavigationSet.swift
//  Carbon
//
//  Created by Kelechi Brian on 12/6/21.
//

import UIKit


class NavigationSet {
    
    func setBack(navigationController:UINavigationController){
        let navBar = navigationController.navigationBar
        navBar.scrollEdgeAppearance =  UINavigationBarAppearance()
        navBar.backgroundColor = .lightGray.withAlphaComponent(0.2)
    }
    
    func setBackButton(navigationItem:UINavigationItem) {
        let backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        backBarButtonItem.tintColor = UIColor(named: "primary")
        navigationItem.backBarButtonItem = backBarButtonItem
         
    }
}
