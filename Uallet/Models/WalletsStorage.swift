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

    let KEY_WALLET = "wallets_json"
    var wallets: [Wallet] = []
    
    init() { load() }
    
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


    func add(wallet: Wallet) {
        wallets.append(wallet)
        save()
    }
}
