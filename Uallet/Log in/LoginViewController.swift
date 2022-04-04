//
//  ViewController.swift
//  Uallet
//
//  Created by Flaminia Castaño on 25/03/2022.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    //IBOUTLET
    @IBOutlet weak var txtUsuario: UITextField!
    @IBOutlet weak var txtContraseña: UITextField!
    @IBOutlet weak var btnInicioSesion: UIButton!
    @IBOutlet weak var switchGuardarDato: UISwitch!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        if Storage.isLoggedIn() {
            switchGuardarDato.setOn(true, animated: false)
            creacionTabBar()
        } else {
            switchGuardarDato.setOn(false, animated: false)
        }
    }
    
    //Cierra el teclado
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder() // oculta el teclado
        return true
    }
    
    //Alerta cuando pone el usuario o la contraseña mal
    func mostrarAlertaLoginFallido(message: String){
        let attributedString = NSAttributedString(string: message, attributes: [
                    NSAttributedString.Key.font : UIFont.systemFont(ofSize: 15),
                    NSAttributedString.Key.foregroundColor : UIColor.red
                ])
        let alerta = UIAlertController(title: "Ups :S", message: message, preferredStyle: .alert)
        
        alerta.setValue(attributedString, forKey: "attributedMessage")
        
        present(alerta, animated: true, completion: nil)
        
        let tiempo = DispatchTime.now() + 2
        DispatchQueue.main.asyncAfter(deadline: tiempo){
            alerta.dismiss(animated: true, completion: nil)
        }
    }
    
    //Creación de TAB BAR
    func creacionTabBar() {
        let tapBar = MainTabBarViewController()
        tapBar.modalPresentationStyle = .fullScreen
        present(tapBar, animated: false)
    }
    
    //IBACTION
    
    //Botón de inicio de sesión
    @IBAction func btnInicioSesion(_ sender: Any) {
        
        // Intentá hacer lo siguiente
        // si llega a generar excepción: NO ME IMPORTA, seguí de largo
        
        try? UserAPI.login("","") {_ in
            
        }
        
        do {
            try UserAPI.login(txtUsuario.text!, txtContraseña.text!) { logueado in
                if logueado {
                    //CREACIÓN TAB BAR
                    creacionTabBar()
                    if switchGuardarDato.isOn {
                        //guardar info de inicio de sesión
                        Storage.setLogIn(value: true)
                        switchGuardarDato.setOn(true, animated: false)
                        
                    } else {
                        Storage.setLogIn(value: false)
                        switchGuardarDato.setOn(false, animated: false)
                    }
                } else {
                        mostrarAlertaLoginFallido(message: "Datos incorrectos.")
                }
            }
        } catch APIError.UserIncomplete {
            mostrarAlertaLoginFallido(message:"No se ingresó el usuario")
        } catch APIError.PasswordIncomplete {
            mostrarAlertaLoginFallido(message:"No se ingresó la contraseña")
        } catch {
            mostrarAlertaLoginFallido(message:"Error desconocido")
        }
    }
    
    //Gesture recognizer para que cuando apretas por fuera de los textfields, se cierre el teclado
    @IBAction func tocoFondo(_ sender: Any) {
        txtUsuario.resignFirstResponder()
        txtContraseña.resignFirstResponder()
    }
    
}

