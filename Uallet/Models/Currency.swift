//
//  Currency.swift
//  Uallet
//
//  Created by Flaminia Castaño on 05/04/2022.
//

import Foundation

enum Currency: String, Codable {
   case Pesos = "$"
   case Dollar = "USD"
   case Bitcoin = "BTC"
    
   
    static func from(index: Int) -> Currency {
        switch index {
        case 0:
            return .Pesos
        case 1:
            return .Dollar
        default:
            return .Bitcoin
        }
    }
}
