//
//  TransactionsList.swift
//  Cashable
//
//  Created by Umid Saidov on 03/11/21.
//

import SwiftUI
import CoreData

struct TransactionsSection: View {
    
    @Environment(\.managedObjectContext)
    var context: NSManagedObjectContext
    
    @State var transactionToEdit: Transaction?
    
    var limit: Int = 0
    var type: AccountType
    var transactions: FetchedResults<Transaction>
    
    var body: some View {
        Section {
            ForEach(getTransactions(limit: limit)) { (transaction: Transaction) in
                TransactionRow(title: transaction.title, type: transaction.typeEnum, category: transaction.categoryEnum, amount: transaction.amount.doubleValue, date: transaction.dateText, onTapGesture: {
                    self.transactionToEdit = transaction
                })
            }
            .onDelete(perform: onDelete)
            .sheet(item: $transactionToEdit, onDismiss: { transactionToEdit = nil }) { (transaction: Transaction) in
                TransactionForm(transactionToEdit: transactionToEdit, type: transactionToEdit?.typeEnum ?? TransactionType.income, title: transaction.title, amount: transaction.amount.doubleValue, category: transaction.categoryEnum, account: transaction.accountEnum, date: transaction.date)
            }
        }
    }
    
}

extension TransactionsSection {
    private func getTransactions(limit: Int) -> [Transaction] {
        if limit == 0 {
            return transactions.filter {
                if type == .balance {
                    return $0.account == "main" || $0.account == "reserve"
                }
                return $0.account == type.rawValue
            }
        } else {
            return Array(transactions.prefix(limit))
        }
    }
    private func onDelete(with indexSet: IndexSet) {
        indexSet.forEach { index in
            let transaction = transactions[index]
            context.delete(transaction)
        }
        context.saveContext()
    }

}
