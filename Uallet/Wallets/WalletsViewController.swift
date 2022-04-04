//
//  WalletsViewController.swift
//  Uallet
//
//  Created by Flaminia Castaño on 29/03/2022.
//

import UIKit

class WalletsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Wallets"
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Agregar", style: .plain, target: self, action: #selector(agregarWallet))
        self.navigationItem.rightBarButtonItem?.tintColor = UIColor(named: "Violeta")
        self.navigationItem.rightBarButtonItem?.image = UIImage(systemName: "plus")
    }

    @objc func agregarWallet(){
        let walletVC = WalletAddViewController()
        let walletNavigationVC = UINavigationController(rootViewController: walletVC)
        present(walletNavigationVC, animated: true)
    }
}
