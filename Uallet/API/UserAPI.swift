//
//  UserAPI.swift
//  Uallet
//
//  Created by Flaminia Castaño on 29/03/2022.
//

import Foundation

enum APIError: Error {
   case UserIncomplete, PasswordIncomplete, ServerError
}

class UserAPI {
    // closure: función tratada como variable, expresión lambda, función anónima, función literal
  
    static func login(_ user: String,
                      _ password: String,
                      onFinished callback: (Bool)->Void) throws {
        
        // abro una base de datos (caso imaginario)
        // database.open()
        defer{
            // cierro la base de datos cuando la función termine
            // database.close()
        }
        
        guard user.count >= 4 else {
            throw APIError.UserIncomplete
        }
        
        guard password.count >= 4 else {
            throw APIError.PasswordIncomplete
        }
        
        // asincrónico
        if user == "admin" && password == "123456"{
            callback(true)
        }else{
            callback(false)
        }
        
    }
    
}


