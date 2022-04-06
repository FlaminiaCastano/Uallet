//
//  Wallet.swift
//  Uallet
//
//  Created by Flaminia Castaño on 05/04/2022.
//

import Foundation

struct Wallet: Codable {
    var name: String
    var balance: Double
    var currency: Currency
}
