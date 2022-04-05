//
//  APICotizacionesPromises.swift
//  Uallet
//
//  Created by Flaminia Castaño on 04/04/2022.
//

import Foundation
import Alamofire
import PromiseKit


extension APICotizaciones {
    
    static func bitcoinRatePromises() -> Promise<Double> {
        return Promise { resolver in
            AF.request("http://api.coindesk.com/v1/bpi/currentprice.json")
                .responseDecodable(of: APIBitcoinResponse.self) {
                response in
                    if let value = response.value {
                        let rate = value.bpi.usd.rateFloat
                        resolver.fulfill(rate) // cumple con la promeda
                    } else {
                        resolver.reject(APIError.ServerError) // rechaza la promesa
                    }
                }
                    
        }
    }
    
    static func dolarBlueRatePromises()-> Promise<DolarRate> {
        return Promise { resolver in
            AF.request("http://api-dolar-argentina.herokuapp.com/api/dolarblue")
                .responseDecodable(of: APIDolarArgentinaResponse.self) {
                response in
                
                    if let value = response.value {
                        if let rateVenta = Double(value.venta), let rateCompra = Double(value.compra) {
                            let rateValor = DolarRate(compra: rateCompra, venta: rateVenta)
                                resolver.fulfill(rateValor)
                        } else {
                            resolver.reject(APIError.ServerError)
                        }
                    } else {
                        resolver.reject(APIError.ServerError)
                    }
                    
            }
        }
        
    }
    
}
