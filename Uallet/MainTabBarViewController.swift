//
//  MainTabBarViewController.swift
//  Uallet
//
//  Created by Flaminia Castaño on 30/03/2022.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    
    override func loadView() {
        super.loadView()
        
        self.tabBar.tintColor = UIColor(named: "Violeta")
        
        
        let homeVC = HomeViewController()
        let homeIcono = UIImage(systemName: "house")
        let homeNavigationVC = UINavigationController(rootViewController: homeVC)
        homeNavigationVC.tabBarItem = UITabBarItem(title: "Home", image: homeIcono, selectedImage: nil)
        
        let dashboardsVC = DashboardsViewController()
        let dashIcono = UIImage(systemName: "list.dash")
        let dashNavigationVC = UINavigationController(rootViewController: dashboardsVC)
        dashNavigationVC.tabBarItem = UITabBarItem(title: "Dashboards", image: dashIcono, selectedImage: nil)
        
        let walletsVC = WalletsTableViewController()
        let walletIcono = UIImage(systemName: "wallet.pass.fill")
        let walletsNavigationVC = UINavigationController(rootViewController: walletsVC)
        walletsNavigationVC.tabBarItem = UITabBarItem(title: "Wallets", image: walletIcono, selectedImage: nil)
        
        let infoVC = InfoViewController()
        let infoIcono = UIImage(systemName: "info.circle.fill")
        let infoNavigationVC = UINavigationController(rootViewController: infoVC)
        infoNavigationVC.tabBarItem = UITabBarItem(title: "Información", image: infoIcono, selectedImage: nil)
        
        self.viewControllers = [homeNavigationVC,dashNavigationVC,walletsNavigationVC,infoNavigationVC]
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

}
