//
//  HomeTabViewController.swift
//  BottomAppBar
//
//  Created by Junio Moquiuti on 20/02/20.
//  Copyright © 2020 Junio Moquiuti. All rights reserved.
//

import UIKit

final class HomeTabViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        addTabs()
        addGestureRecognized()
    }
    
    private func addTabs() {
        
        let tab1 = UIViewController()
        tab1.view.backgroundColor = .red
        tab1.tabBarItem = UITabBarItem(title: "First", image: nil, selectedImage: nil)
        
        let tab2 = UIViewController()
        tab2.tabBarItem.isEnabled = false

        let tab3 = UIViewController()
        tab3.view.backgroundColor = .yellow
        tab3.tabBarItem = UITabBarItem(title: "Second", image: nil, selectedImage: nil)

        let viewControllers = [
            tab1,
            tab2,
            tab3
        ]
        
        self.setViewControllers(viewControllers, animated: false)
    }
    
    private func addGestureRecognized() {
        if let customTabBar = tabBar as? CustomTabBar {
            customTabBar.middleButton.addTarget(self, action: #selector(middleButtonDidTap), for: .touchUpInside)
        }
    }

    @objc func middleButtonDidTap() {
        print("TODO more did tap")
    }
}
