//
//  Category.swift
//  Cashable
//
//  Created by Umid Saidov on 01/11/21.
//

import SwiftUI

enum Category: String, CaseIterable {
    
    case food
    case entertainment
    case health
    case shopping
    case transportation
    case utilities
    case other
    
    var systemNameIcon: String {
        switch self {
        case .food:
                return "takeoutbag.and.cup.and.straw.fill"
        case .entertainment:
                return "theatermasks.fill"
        case .health:
                return "staroflife.fill"
        case .shopping:
                return "cart.fill"
        case .transportation:
                return "car.fill"
        case .utilities:
                return "bolt.fill"
        case .other:
                return "tag.fill"
        }
    }
    
    var color: Color {
        switch self {
            case .food:
                return Color.green
            case .entertainment:
                return Color.yellow
            case .health:
                return Color.red
            case .shopping:
                return Color.teal
            case .transportation:
                return Color.blue
            case .utilities:
                return Color.orange
            case .other:
                return Color.mint
        }
    }
}

extension Category: Identifiable {
    var id: String { rawValue }
}
