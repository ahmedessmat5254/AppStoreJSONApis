//
//  BaseTabBarController.swift
//  AppStoreJSONAPIs
//
//  Created by Ahmed Essmat on 06/07/2021.
//

import UIKit

class BaseTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        let todayViewController     = UIViewController()
        let appsViewController = UIViewController()
        
        
        viewControllers = [
            createTabController(viewController: todayViewController, imageName: "today", title: "Today"),
            createTabController(viewController: appsViewController, imageName: "apps", title: "Apps"),
            createTabController(viewController: SearchViewController(), imageName: "search", title: "Search")
            
        ]
       
    }
    
    fileprivate func createTabController(viewController: UIViewController, imageName: String, title: String) -> UINavigationController {
        let navController = UINavigationController(rootViewController: viewController)
        navController.navigationBar.prefersLargeTitles = true
        viewController.tabBarItem.image = UIImage(named: imageName)
        viewController.navigationItem.title = title
        viewController.view.backgroundColor = .white
        viewController.tabBarItem.title = title
        
        
        
        return navController
    }
}