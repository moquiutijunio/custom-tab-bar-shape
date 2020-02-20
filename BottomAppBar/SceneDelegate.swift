//
//  SceneDelegate.swift
//  BottomAppBar
//
//  Created by Junio Moquiuti on 20/02/20.
//  Copyright © 2020 Junio Moquiuti. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let homeTabViewController = UINib(nibName: "HomeTabViewController", bundle: nil).instantiate(withOwner: nil, options: nil).first as! HomeTabViewController
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = homeTabViewController
        window.makeKeyAndVisible()
        window.windowScene = windowScene
        self.window = window
    }
}

