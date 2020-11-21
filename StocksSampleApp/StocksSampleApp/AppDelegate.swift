//
//  AppDelegate.swift
//  StocksSampleApp
//
//  Created by Xamarin PC on 20/11/20.
//  Copyright © 2020 Shivam Seth. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow()
        initAppController()

        window?.makeKeyAndVisible()

        // Override point for customization after application launch.
        return true
    }


    func initAppController() {
        let tabController = UITabBarController()
                        
        tabController.tabBar.tintColor = Colors.blueColor
        //        tabController.tabBar.barTintColor = Colors.blueColor
                        
                
        guard let homeController: HomeViewController = HomeViewController.viewController() else { return }
            
        homeController.viewModel = HomeViewModel()
        homeController.tabBarItem = UITabBarItem(title: "Home", image: UIImage(named: "home"), selectedImage: UIImage(named: "home"))
         
        guard let homeController1: HomeViewController = HomeViewController.viewController() else { return }
            
        homeController1.viewModel = HomeViewModel()
        homeController1.tabBarItem = UITabBarItem(title: "Search", image: UIImage(named: "offline"), selectedImage: UIImage(named: "home"))
        
        guard let homeController2: HomeViewController = HomeViewController.viewController() else { return }
            
        homeController2.viewModel = HomeViewModel()
        homeController2.tabBarItem = UITabBarItem(title: "TimeLine", image: UIImage(named: "allout"), selectedImage: UIImage(named: "home"))
     
        guard let homeController3: HomeViewController = HomeViewController.viewController() else { return }
            
        homeController3.viewModel = HomeViewModel()
        homeController3.tabBarItem = UITabBarItem(title: "Settings", image: UIImage(named: "abcd"), selectedImage: UIImage(named: "home"))
        
        tabController.viewControllers = [homeController, homeController1, homeController2, homeController3].map { UINavigationController(rootViewController: $0)}
                        
                        
        window?.rootViewController = tabController
    }
    
}

