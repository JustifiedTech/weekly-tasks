//
//  SceneDelegate.swift
//  Carbon
//
//  Created by Decagon on 11/27/21.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let appWindow = UIWindow(frame: windowScene.coordinateSpace.bounds)
        appWindow.windowScene = windowScene
        self.window = appWindow
        appWindow.backgroundColor = .systemBackground
        AppDelegate.standard.window = appWindow
        let coordinator = MainCoordinator(window: appWindow)
        coordinator.start()
        
    }
        
}

