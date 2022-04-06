//
//  WalletDetailViewController.swift
//  Uallet
//
//  Created by Flaminia Castaño on 06/04/2022.
//

import UIKit

class WalletDetailViewController: UIViewController {
    @IBOutlet weak var tipoMoneda: UILabel!
    @IBOutlet weak var saldo: UILabel!
    @IBOutlet weak var vistaBack: UIView!
    @IBOutlet weak var vistaEdicion: UIView!
    @IBOutlet weak var nuevoSaldo: UITextField!
    
    var wallet: Wallet?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpView()
    }
    
    func setUpView(){
        self.title = wallet?.name
        tipoMoneda.text = wallet?.currency.rawValue
        saldo.text = "\(wallet!.balance)"
        vistaBack.layer.borderColor = UIColor(named: "Violeta")?.cgColor
        vistaBack.layer.borderWidth = 2
        vistaBack.layer.cornerRadius = 15
        vistaEdicion.layer.borderColor = UIColor(named: "Violeta")?.cgColor
        vistaEdicion.layer.borderWidth = 2
        vistaEdicion.layer.cornerRadius = 15
        
    }

    @IBAction func editarSaldo(_ sender: Any) {
        vistaEdicion.isHidden = false
    }
    
    @IBAction func editarFinal(_ sender: Any) {
        wallet?.balance = Double(nuevoSaldo.text!) ?? 0
        vistaEdicion.isHidden = true
        saldo.text = "\(wallet!.balance)"
        
        //RELOAD DATA??
    }
    
    @IBAction func eliminarWallet(_ sender: Any) {
    }
    
}
