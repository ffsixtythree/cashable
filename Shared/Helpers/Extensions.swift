//
//  Extensions.swift
//  Cashable
//
//  Created by Umid Saidov on 01/11/21.
//

import Foundation

extension Double {
    
    var formattedCurrencyText: String {
        return Utils.numberFormatter.string(from: NSNumber(value: self)) ?? "0"
    }
    
}
