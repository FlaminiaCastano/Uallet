//
//  FormatoDate.swift
//  Uallet
//
//  Created by Flaminia Castaño on 05/04/2022.
//

import Foundation

extension Date {
    func string(with format: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
    
    func fechaCompleta(date: Date) -> String{
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return dateFormatterGet.string(from: self)
    }
    
    func fechaNombre(date: Date) -> String {
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "MMM dd,yyyy"
        return dateFormatterGet.string(from: self)
    }
}

