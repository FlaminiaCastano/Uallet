//
//  WalletsStorage.swift
//  Uallet
//
//  Created by Flaminia Castaño on 05/04/2022.
//

import Foundation
import PromiseKit

class WalletsStorage {
    
    // Singleton
    static var shared = WalletsStorage()

    let KEY_WALLET = "wallets_json"
    var wallets: [Wallet] = []
    
    private var listeners: [()->Void] = []
    
    init() { load() }
    
    func addDataChanged(listener: @escaping ()->Void) {
        listeners.append(listener)
    }
    
    func save() {
        let encoder = JSONEncoder()
        if let dataJson = try? encoder.encode(wallets) {
            UserDefaults.standard.set(dataJson, forKey: KEY_WALLET)
        } else {
            print("No se pudo convertir a JSON")
        }
        
    }
    
    func load() {
        if let dataJson = UserDefaults.standard.data(forKey: KEY_WALLET) {
            let decoder = JSONDecoder()
            do {
                wallets = try decoder.decode([Wallet].self, from: dataJson)
            } catch {
                print("No se pudo convertir el JSON")
            }
        }
    }

    func notifyUpdates() {
        // Hubo cambios en los datos
        save()
        // recorro todos los listeners y los invoco
        for listener in listeners {
            listener()
        }
    }

    func add(wallet: Wallet) {
        wallets.append(wallet)
        notifyUpdates()
    }
    
    func delete(wallet: Wallet) {
        wallets.removeAll { currentWallet in
            return currentWallet == wallet
        }
        notifyUpdates()
    }
    
    func editBalance(wallet: Wallet, balance: Double) {
        // versión imperativa
        for (i, currentWallet) in wallets.enumerated() {
            if currentWallet == wallet {
                wallets[i].balance = balance
            }
        }
        notifyUpdates()
    }
    
    func walletsPromise() -> Promise<[Wallet]> {
        return Promise { resolver in
            resolver.fulfill(self.wallets)
        }
    }
}
