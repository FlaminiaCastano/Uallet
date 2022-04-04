//
//  HomeViewController.swift
//  Uallet
//
//  Created by Flaminia Castaño on 29/03/2022.
//

import UIKit

class HomeViewController: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Home"

        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Cerrar sesión", style: .plain, target: self, action: #selector(logout))
        self.navigationItem.rightBarButtonItem?.tintColor = UIColor(named: "Violeta")
        
    }
    
    @objc func logout(){
        Storage.setLogIn(value: false)
        dismiss(animated: true)
    }
    

}
