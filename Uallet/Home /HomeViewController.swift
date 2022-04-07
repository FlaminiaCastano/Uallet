//
//  HomeViewController.swift
//  Uallet
//
//  Created by Flaminia Castaño on 29/03/2022.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var DatosView: UIView!
    @IBOutlet weak var cantidadWallets: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Home"

        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Cerrar sesión", style: .plain, target: self, action: #selector(logout))
        self.navigationItem.rightBarButtonItem?.tintColor = UIColor(named: "Violeta")
        
        updateInfo()
        
        WalletsStorage.shared.addDataChanged {
            self.updateInfo()
        }
        
        setUpView()
        
    }
    
    func setUpView() {
        DatosView.layer.borderColor = UIColor(named: "Violeta")?.cgColor
        DatosView.layer.borderWidth = 2
        DatosView.layer.cornerRadius = 15
    }
    
    func updateInfo() {
        cantidadWallets.text = "Hay \(WalletsStorage.shared.wallets.count) wallet(s)"
    }
    
    @objc func logout(){
        Storage.setLogIn(value: false)
        dismiss(animated: true)
    }
    
    
    

}
