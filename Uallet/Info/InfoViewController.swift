//
//  InfoViewController.swift
//  Uallet
//
//  Created by Flaminia Castaño on 29/03/2022.
//

import UIKit
import Alamofire
import PromiseKit

class InfoViewController: UIViewController {
    
    //Dolar Oficial
    @IBOutlet weak var viewDolarOficial: UIView!
    @IBOutlet weak var titleDolarOficial: UILabel!
    @IBOutlet weak var valorCompraDolarOficial: UILabel!
    @IBOutlet weak var valorVentaDolarOficial: UILabel!
    // Bitcoin
    @IBOutlet weak var viewBitcoin: UIView!
    @IBOutlet weak var titleBitcoin: UILabel!
    @IBOutlet weak var valorBitcoinPesos: UILabel!
    
    @IBOutlet weak var activityLoading: UIActivityIndicatorView!
    
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var buttonRefrescarInfo: UIButton!
    
    var date = Date()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Información"
        
        setUpView()
        leerCotizacion()
        
        
    }
    
    
    func setUpView() {
        viewDolarOficial.layer.borderColor = UIColor(named: "Violeta")?.cgColor
        viewDolarOficial.layer.borderWidth = 2
        viewDolarOficial.layer.cornerRadius = 15
        
        viewBitcoin.layer.borderColor = UIColor(named: "Violeta")?.cgColor
        viewBitcoin.layer.borderWidth = 2
        viewBitcoin.layer.cornerRadius = 15
        
        buttonRefrescarInfo.layer.cornerRadius = 15
        
        date = Date.now
        activityLoading.isHidden = true
        titleLabel.text = "Valor al \(date.fechaCompleta(date: date))"
        titleLabel.textColor = UIColor(named: "Violeta")
        
    }

    func leerCotizacion() {
        
        activityLoading.isHidden = false
        activityLoading.startAnimating()
        valorCompraDolarOficial.text = ""
        valorVentaDolarOficial.text = ""
        valorBitcoinPesos.text = ""
        
        firstly {
            when (fulfilled:
                    APICotizaciones.bitcoinRatePromises(),
                  APICotizaciones.dolarBlueRatePromises()
            )
        }
        .done { rates in
            //Se cumplen las tres promesas
            self.valorBitcoinPesos.text = " 1 BTC = \(rates.0) USD"
            self.valorCompraDolarOficial.text = String(rates.1.compra)
            self.valorVentaDolarOficial.text = String(rates.1.venta)
        }
        .catch { error in
            self.valorBitcoinPesos.text = "Error"
            self.valorCompraDolarOficial.text = "Error"
            self.valorVentaDolarOficial.text = "Error"
        }
        .finally {
            self.activityLoading.stopAnimating()
            self.activityLoading.isHidden = true 
        }
        
    }
    
    
    @IBAction func buttonRefrescarInfo(_ sender: Any) {
        leerCotizacion()
    }
    
}
