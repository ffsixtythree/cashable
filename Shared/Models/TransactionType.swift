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
    
    var systemNameIcon: String {
        switch self {
            case .income:
                return "arrow.down.circle.fill"
            case .expense:
                return "arrow.up.circle.fill"
        }
    }
    
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
