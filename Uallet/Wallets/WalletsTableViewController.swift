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
        
        setUpView()
        
    }
    
    func setUpView() {
        self.title = "Wallets"
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Agregar", style: .plain, target: self, action: #selector(agregarWallet))
        self.navigationItem.rightBarButtonItem?.tintColor = UIColor(named: "Violeta")
        self.navigationItem.rightBarButtonItem?.image = UIImage(systemName: "plus")
        
        // Registrar una celda custom
        let nib = UINib(nibName: "WalletCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: cellIdentifier)
        
        // Registro un listener para cuando los datos cambien
        WalletsStorage.shared.addDataChanged {
            self.tableView.reloadData()
        }
    }
    
    // MARK: - Eventos de UI
    
    @objc func agregarWallet(){
    
        let walletVC = WalletAddViewController()
        present(UINavigationController(rootViewController: walletVC), animated: true)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return WalletsStorage.shared.wallets.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let wallet = WalletsStorage.shared.wallets[indexPath.row]
        
        let detailsVC = WalletDetailViewController()
        detailsVC.wallet = wallet
        
        navigationController?.pushViewController(detailsVC, animated: true)
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let wallet = WalletsStorage.shared.wallets[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier,
                                                 for: indexPath) as! WalletCell

        cell.nombreWallet.text = wallet.name
        cell.monto.text = "\(wallet.balance)"
        cell.moneda.text = wallet.currency.rawValue
        
        switch(wallet.currency.rawValue){
            case "$":
                cell.viewBack.backgroundColor = UIColor.lightGray
                cell.viewBack.layer.cornerRadius = 5
            case "USD":
            cell.viewBack.backgroundColor = UIColor.systemGreen
                cell.viewBack.layer.cornerRadius = 5
            default:
                cell.viewBack.backgroundColor = UIColor.yellow
                cell.viewBack.layer.cornerRadius = 5
        }
        
        cell.backgroundColor = UIColor(named: "pastel")
        

        return cell
    }
    
}
