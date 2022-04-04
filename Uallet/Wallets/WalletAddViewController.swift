//
//  WalletAddViewController.swift
//  Uallet
//
//  Created by Flaminia Castaño on 30/03/2022.
//

import UIKit

class WalletAddViewController: UIViewController, UITextFieldDelegate {

    
    @IBOutlet weak var txtNombreWallet: UITextField!
    @IBOutlet weak var txtMontoWallet: UITextField!
    @IBOutlet weak var tipoMoneda: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Agregar Wallet"
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cerrar", style: .plain, target: self, action: #selector(cerrar))
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Agregar", style: .plain, target: self, action: #selector(agregar))
        self.navigationItem.rightBarButtonItem?.tintColor = UIColor(named: "Violeta")
        self.navigationItem.leftBarButtonItem?.tintColor = UIColor(named: "Violeta")

        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder() // oculta el teclado
        return true
    }
    

    @objc func cerrar() {
        dismiss(animated: true)
    }
        
    @objc func agregar() {
        //por ahora solo cierra la imagen
        dismiss(animated: true)
    }
    
    //Gesture recognizer para que cuando apretas por fuera de los textfields, se cierre el teclado
    @IBAction func tocoFondo(_ sender: Any) {
        txtNombreWallet.resignFirstResponder()
        txtMontoWallet.resignFirstResponder()
    }
    
    @IBAction func didChangeSegment(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            
        } else if sender.selectedSegmentIndex == 1 {
            
        } else if sender.selectedSegmentIndex == 2 {
            
        }
        
        
        
    }
    
}
