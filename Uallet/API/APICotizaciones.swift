//
//  APICotizaciones.swift
//  Uallet
//
//  Created by Flaminia Castaño on 04/04/2022.
//

import Foundation
import Alamofire


class APICotizaciones {
    
    static func bitcoinRate(callback: @escaping (Bool, Double?)->Void ) {
        AF.request("http://api.coindesk.com/v1/bpi/currentprice.json")
            .responseDecodable(of: APIBitcoinResponse.self) {
            response in
            
                if let value = response.value {
                    let rate = value.bpi.usd.rateFloat
                    callback(true, rate)
                } else {
                    callback(false, nil)
                    
                }
                
        }
    }
    
    static func dolarBlueRate(callback: @escaping (Bool, Double?, Double?)->Void ) {
        AF.request("https://api-dolar-argentina.herokuapp.com/api/dolarblue")
            .responseDecodable(of: APIDolarArgentinaResponse.self) {
            response in
            
                if let value = response.value {
                    if let rate = Double(value.compra) {
                        if let rate2 = Double(value.venta){
                            callback(true, rate, rate2)
                        } else {
                            callback(true, rate, nil)
                        }
                    } else {
                        callback(false, nil, nil)
                    }
                } else {
                    callback(false, nil, nil)
                    
                }
                
        }
        
    }
    
    
}
