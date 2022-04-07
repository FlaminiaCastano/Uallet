//
//  WalletDetailViewController.swift
//  Uallet
//
//  Created by Flaminia Castaño on 06/04/2022.
//

import UIKit

class WalletDetailViewController: UIViewController {
    @IBOutlet weak var tipoMoneda: UILabel!
    @IBOutlet weak var vistaBack: UIView!
    @IBOutlet weak var saldo: UITextField!
    
    var wallet: Wallet?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpView()
    }
    
    func setUpView(){
        self.title = wallet?.name
        tipoMoneda.text = wallet?.currency.rawValue
        let balance = wallet?.balance ?? 0
        saldo.text = "\(balance)"
        vistaBack.layer.borderColor = UIColor(named: "Violeta")?.cgColor
        vistaBack.layer.borderWidth = 2
        vistaBack.layer.cornerRadius = 15
    }
    
    @IBAction func eliminarWallet(_ sender: Any) {
        let alert = UIAlertController(title: "Eliminar Wallet", message: "¿Estás seguro/a que querés eliminar la wallet? No se puede recuperar", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Eliminar", style: .destructive, handler: { _ in
            WalletsStorage.shared.delete(wallet: self.wallet!)
            self.navigationController?.popViewController(animated: true)
        }))
        alert.addAction(UIAlertAction(title: "Cancelar", style: .cancel))
        present(alert, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        WalletsStorage.shared.editBalance(wallet: self.wallet!, balance: Double(saldo.text!) ?? 0)
    }
    
}
