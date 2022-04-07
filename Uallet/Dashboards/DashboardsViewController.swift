//
//  DashboardsViewController.swift
//  Uallet
//
//  Created by Flaminia Castaño on 29/03/2022.
//

import UIKit
import PromiseKit

class DashboardsViewController: UIViewController {

    @IBOutlet weak var saldoPesos: UILabel!
    @IBOutlet weak var saldoUSD: UILabel!
    @IBOutlet weak var saldoBTC: UILabel!
    @IBOutlet weak var selectorMoneda: UISegmentedControl!
    @IBOutlet weak var monedaSeleccionada: UILabel!
    @IBOutlet weak var saldoTotal: UILabel!
    
    @IBOutlet weak var vistaPesos: UIView!
    @IBOutlet weak var vistaDolares: UIView!
    @IBOutlet weak var vistaBTC: UIView!
    
    @IBOutlet weak var vistaSaldoTotal: UIView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Dashboards"
        
        // actualiza balance si hay cambio en los datos
        WalletsStorage.shared.addDataChanged {
            self.updateBalance()
        }
        
        setUpView()
    }
    
    func setUpView(){
        vistaPesos.layer.borderColor = UIColor(named: "Violeta")?.cgColor
        vistaPesos.layer.borderWidth = 2
        vistaPesos.layer.cornerRadius = 15
        
        vistaDolares.layer.borderColor = UIColor(named: "Violeta")?.cgColor
        vistaDolares.layer.borderWidth = 2
        vistaDolares.layer.cornerRadius = 15
        
        vistaBTC.layer.borderColor = UIColor(named: "Violeta")?.cgColor
        vistaBTC.layer.borderWidth = 2
        vistaBTC.layer.cornerRadius = 15
        
        vistaSaldoTotal.layer.borderColor = UIColor(named: "Violeta")?.cgColor
        vistaSaldoTotal.layer.borderWidth = 2
        vistaSaldoTotal.layer.cornerRadius = 15
    }

    override func viewWillAppear(_ animated: Bool) {
        // actualizar balance si hubiera cambio en cotizaciones
        updateBalance() // por si cambian las cotizaciones
    }

    func updateBalance() {
        self.saldoPesos.text = "⌛️"
        self.saldoUSD.text = "⌛️"
        self.saldoBTC.text = "⌛️"
        self.saldoTotal.text = "⌛️"
        
        firstly {
            when(fulfilled:
                    APICotizaciones.bitcoinRatePromises(),
                    APICotizaciones.dolarBlueRatePromises(),
                    WalletsStorage.shared.walletsPromise()
            )
        }
        .done { (rateBitcoin, rateDolar, wallets) in
            var sumaDolar: Double = 0
            var sumaPesos: Double = 0
            var sumaBTC: Double = 0
            var sumaTotalDolares: Double = 0
            var sumaTotalPesos: Double = 0
            var sumaTotalBTC: Double = 0
            
            
            for wallet in wallets {
                switch wallet.currency {
                case .Pesos:
                    sumaPesos += wallet.balance
                    sumaTotalPesos += wallet.balance
                    sumaTotalDolares += wallet.balance / rateDolar.compra
                    sumaTotalBTC += (wallet.balance / rateDolar.compra) / rateBitcoin
                case .Dollar:
                    sumaDolar += wallet.balance
                    sumaTotalDolares += wallet.balance
                    sumaTotalPesos += wallet.balance * rateDolar.venta
                    sumaTotalBTC += wallet.balance / rateBitcoin
                case .Bitcoin:
                    sumaBTC += wallet.balance
                    sumaTotalDolares += wallet.balance * rateBitcoin
                    sumaTotalPesos += (wallet.balance * rateBitcoin) * rateDolar.venta
                    sumaTotalBTC += wallet.balance
                }
            }
            self.saldoPesos.text = "\(sumaPesos)"
            self.saldoUSD.text = "\(sumaDolar)"
            self.saldoBTC.text = "\(sumaBTC)"
            
            let currency = Currency.from(index: self.selectorMoneda.selectedSegmentIndex)
            
            self.monedaSeleccionada.text = "\(currency)"
            
            if currency == .Pesos {
                self.saldoTotal.text = "\(sumaTotalPesos)"
            } else if currency == .Dollar {
                self.saldoTotal.text = "\(sumaTotalDolares)"
            } else {
                self.saldoTotal.text = "\(sumaTotalBTC)"
            }
            
            
        }
        .catch { error in
            self.saldoTotal.text = "Error"
        }
    }
    
    @IBAction func cambioDeMoneda(_ sender: Any) {
        updateBalance()
    }
    
}
