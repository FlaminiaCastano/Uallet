//
//  WalletsStorage.swift
//  Uallet
//
//  Created by Flaminia Castaño on 05/04/2022.
//

import Foundation

class WalletsStorage {
    
    // Singleton
    static var shared = WalletsStorage()

    var wallets: [Wallet] = []

    init() {
        // Fake Wallets
        wallets.append(Wallet(name: "Ualá", balance: 30000, currency: .Pesos))
        wallets.append(Wallet(name: "Francés", balance: 145, currency: .Dollar))
        wallets.append(Wallet(name: "Belo", balance: 0.0004, currency: .Bitcoin))
    }
    

    func add(wallet: Wallet) {
        wallets.append(wallet)
    }
    
}
