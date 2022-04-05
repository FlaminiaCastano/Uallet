//
//  DolarRate.swift
//  Uallet
//
//  Created by Flaminia Castaño on 05/04/2022.
//

import Foundation

struct DolarRate {
    var compra: Double
    var venta: Double
    
    var description: String {
        get {
            return "Compra: \(self.compra), Venta: \(self.venta)"
        }
    }
}
