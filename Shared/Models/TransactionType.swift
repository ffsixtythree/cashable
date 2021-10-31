//
//  TransactionType.swift
//  Cashable
//
//  Created by Umid Saidov on 01/11/21.
//

import SwiftUI

enum TransactionType: String, CaseIterable {
    
    case income
    case expense
    
    var color: Color {
        switch self {
            case .income:
                return Color.green
            case .expense:
                return Color.red
        }
    }
}

extension TransactionType: Identifiable {
    var id: String { rawValue }
}
