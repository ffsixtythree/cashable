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

//MARK: - Extended values
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

//MARK: Predicates
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

//MARK: Fetching
extension Transaction {
    static func fetchAllCategoriesIncomeSum(context: NSManagedObjectContext, completion: @escaping ([(sum: Double, category: Category)]) -> ()) {
        
                // 2
            let keypathAmount = NSExpression(forKeyPath: \Transaction.amount)
            let expression = NSExpression(forFunction: "sum:", arguments: [keypathAmount])
            
            let sumDesc = NSExpressionDescription()
            sumDesc.expression = expression
            sumDesc.name = "sum"
            sumDesc.expressionResultType = .decimalAttributeType
            
            // 3
            let request = NSFetchRequest<NSFetchRequestResult>(entityName: Transaction.entity().name ?? "Transaction")
            request.returnsObjectsAsFaults = false
            request.propertiesToGroupBy = ["category"]
            request.propertiesToFetch = [sumDesc, "category"]
            request.resultType = .dictionaryResultType
            request.predicate = NSPredicate(format: "type != \(1)")
            
            // 4
            context.perform {
                do {
                    let results = try request.execute()
                    let data = results.map { (result) -> (Double, Category)? in
                        guard
                            let resultDict = result as? [String: Any],
                            let amount = resultDict["sum"] as? Double, amount > 0,
                            let categoryKey = resultDict["category"] as? String,
                            let category = Category(rawValue: categoryKey) else {
                                return nil
                        }
                        return (amount, category)
                    }.compactMap { $0 }
                    completion(data)
                } catch let error as NSError {
                    print((error.localizedDescription))
                    completion([])
                }
            }
            
        }
    static func fetchAllCategoriesExpensesSum(context: NSManagedObjectContext, completion: @escaping ([(sum: Double, category: Category)]) -> ()) {
        
                // 2
            let keypathAmount = NSExpression(forKeyPath: \Transaction.amount)
            let expression = NSExpression(forFunction: "sum:", arguments: [keypathAmount])
            
            let sumDesc = NSExpressionDescription()
            sumDesc.expression = expression
            sumDesc.name = "sum"
            sumDesc.expressionResultType = .decimalAttributeType
            
            // 3
            let request = NSFetchRequest<NSFetchRequestResult>(entityName: Transaction.entity().name ?? "Transaction")
            request.returnsObjectsAsFaults = false
            request.propertiesToGroupBy = ["category"]
            request.propertiesToFetch = [sumDesc, "category"]
            request.resultType = .dictionaryResultType
            request.predicate = NSPredicate(format: "type != \(0)")
            
            // 4
            context.perform {
                do {
                    let results = try request.execute()
                    let data = results.map { (result) -> (Double, Category)? in
                        guard
                            let resultDict = result as? [String: Any],
                            let amount = resultDict["sum"] as? Double, amount > 0,
                            let categoryKey = resultDict["category"] as? String,
                            let category = Category(rawValue: categoryKey) else {
                                return nil
                        }
                        return (amount, category)
                    }.compactMap { $0 }
                    completion(data)
                } catch let error as NSError {
                    print((error.localizedDescription))
                    completion([])
                }
            }
            
        }
}
