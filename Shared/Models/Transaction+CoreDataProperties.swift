//
//  Transaction+CoreDataProperties.swift
//  Cashable
//
//  Created by Umid Saidov on 02/11/21.
//
//

import Foundation
import CoreData


extension Transaction {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Transaction> {
        return NSFetchRequest<Transaction>(entityName: "Transaction")
    }

    @NSManaged public var title: String
    @NSManaged public var date: Date
    @NSManaged public var category: String
    @NSManaged public var account: String
    @NSManaged public var id: UUID?
    @NSManaged public var amount: NSDecimalNumber
    @NSManaged public var type: Int16

}

extension Transaction : Identifiable {
    
    var accountEnum: AccountType {
        get {
            AccountType(rawValue: account) ?? .balance
        }
        set {
            self.account = newValue.rawValue
        }
    }
    
    var typeEnum: TransactionType {
        get {
            TransactionType(rawValue: type) ?? .income
        }
        set {
            self.type = newValue.rawValue
        }
    }

    var categoryEnum: Category {
        get {
            Category(rawValue: category) ?? .other
        }
        set {
            self.category = newValue.rawValue
        }
    }
    
    var amountText: String {
        Utils.numberFormatter.string(from: NSNumber(value: amount.doubleValue )) ?? ""
    }
    
    var dateText: String {
        Utils.dateFormatter.localizedString(for: date, relativeTo: Date())
    }
    
}

extension Transaction {
    static func predicate(searchText: String) -> NSPredicate? {
            var predicates = [NSPredicate]()
            
            // 3
            if !searchText.isEmpty {
                predicates.append(NSPredicate(format: "title CONTAINS[cd] %@", searchText.lowercased()))
            }
            
            // 4
            if predicates.isEmpty {
                return nil
            } else {
                return NSCompoundPredicate(andPredicateWithSubpredicates: predicates)
            }
        }
}
