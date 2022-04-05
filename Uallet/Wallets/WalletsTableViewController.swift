//
//  WalletsTableViewController.swift
//  Uallet
//
//  Created by Flaminia Castaño on 05/04/2022.
//

import UIKit

class WalletsTableViewController: UITableViewController {
    
    let cellIdentifier = "celdaWallets"
        
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        self.clearsSelectionOnViewWillAppear = false
        
        self.title = "Wallets"
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Agregar", style: .plain, target: self, action: #selector(agregarWallet))
        self.navigationItem.rightBarButtonItem?.tintColor = UIColor(named: "Violeta")
        self.navigationItem.rightBarButtonItem?.image = UIImage(systemName: "plus")
        
        // Registrar una celda custom
        let nib = UINib(nibName: "WalletCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: cellIdentifier)
    }
    
    // MARK: - Eventos de UI
    
    @objc func agregarWallet(){
    
        let walletVC = WalletAddViewController()
        walletVC.set { grabo in
            if grabo {
                self.tableView.reloadData()
            }
        }
        present(UINavigationController(rootViewController: walletVC), animated: true)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return WalletsStorage.shared.wallets.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! WalletCell
        
        let wallet = WalletsStorage.shared.wallets[indexPath.row]
        
        cell.nombreWallet.text = wallet.name
        if wallet.currency == .Pesos{
            cell.moneda.text = "$"
        } else if wallet.currency == .Dollar {
            cell.moneda.text = "USD"
        } else {
            cell.moneda.text = "BTC"
        }
        
        
        cell.monto.text = String(wallet.balance)
        
        cell.backgroundColor = UIColor(named: "pastel")

        return cell
    }
    
    
}
