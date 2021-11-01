//
//  AccountType.swift
//  Cashable
//
//  Created by Umid Saidov on 01/11/21.
//

import SwiftUI

enum AccountType: String, CaseIterable {
    
    case balance
    case primary
    case reserve
    
    
    var systemNameIcon: String {
        switch self {
            case .balance:
                return "banknote.fill"
            case .primary:
                return "square.stack.3d.up.fill"
            case .reserve:
                return "bag.fill"
        }
    }
    
    var color: Color {
        switch self {
            case .balance:
                return .blue
            case .primary:
                return .yellow
            case .reserve:
                return .green
        }
    }
}

extension AccountType: Identifiable {
    var id: String { rawValue }
}
