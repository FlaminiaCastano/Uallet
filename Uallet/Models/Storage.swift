//
//  Storage.swift
//  Uallet
//
//  Created by Flaminia Castaño on 29/03/2022.
//

import Foundation


class Storage {
    
    static func setLogIn(value: Bool) {
        let defaults = UserDefaults.standard
        defaults.set(value, forKey: "isLoggedIn")
    }
    
    static func isLoggedIn() -> Bool{
        let defaults = UserDefaults.standard
        let value = defaults.bool(forKey: "isLoggedIn")
        return value
    }

}
