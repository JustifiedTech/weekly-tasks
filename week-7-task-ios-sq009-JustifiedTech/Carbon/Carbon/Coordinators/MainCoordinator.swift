//
//  MainCoordinator.swift
//  Carbon
//
//  Created by Kelechi Brian on 11/27/21.
//

import UIKit

class MainCoordinator: Coordinator{
    var children: [Coordinator]? = nil
    var navigationController: UINavigationController?  = UINavigationController()

    private let window: UIWindow

    init(window: UIWindow ) {
        self.window = window
    }
    
   
    func eventOccurred(with type: Event, user:Int = 0) {
        switch type {
            
        case .signup:
            let vc = SignUpViewController()
            vc.coordinator = self
            navigationController?.pushViewController(vc, animated: false)
            
        case .signin:
            let vc = SignInViewController()
            vc.coordinator = self
            navigationController?.pushViewController(vc, animated: false)
            
        case .profile:
            let vc = ProfileViewController()
            vc.userId = user
            vc.coordinator = self
            navigationController?.pushViewController(vc, animated: false)
        }
    }
    
    func start() {
        
       let (isLogin, user) = UserDefaultData.shared.getUserStatus()
        
        if isLogin {
            showProfileScreen(userId: user)
            
        }
        else {
            showOnboardingScreen()
        }
        
    
    }
    
    func showOnboardingScreen() {
        let onboardingController = OnboardingViewController()
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        onboardingController.coordinator = self
        navigationController?.setViewControllers([onboardingController], animated: false)
       
    }
    
    func showProfileScreen(userId:Int) {
        let profileController = ProfileViewController()
        profileController.userId = userId
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        profileController.coordinator = self
        navigationController?.setViewControllers([profileController], animated: false)
       
    }
    
    
    
    
}
