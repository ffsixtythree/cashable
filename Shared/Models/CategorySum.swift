//
//  CategorySum.swift
//  Cashable
//
//  Created by Umid Saidov on 03/11/21.
//

import Foundation

struct CategorySum: Identifiable, Equatable {
    let sum: Double
    let category: Category
    
    var id: String { "\(category)\(sum)" }
}
