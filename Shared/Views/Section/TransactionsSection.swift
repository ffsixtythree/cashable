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
    
    @FetchRequest(entity: Transaction.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Transaction.date, ascending: false)])
    private var result: FetchedResults<Transaction>
    
    init(predicate: NSPredicate?, sortDescriptor: NSSortDescriptor) {
            let fetchRequest = NSFetchRequest<Transaction>(entityName: Transaction.entity().name ?? "Transaction")
            fetchRequest.sortDescriptors = [sortDescriptor]
            
            if let predicate = predicate {
                fetchRequest.predicate = predicate
            }
            _result = FetchRequest(fetchRequest: fetchRequest)
        }
    
    var body: some View {
        Section {
            ForEach(result) { (transaction: Transaction) in
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
    private func onDelete(with indexSet: IndexSet) {
        indexSet.forEach { index in
            let transaction = result[index]
            context.delete(transaction)
        }
        context.saveContext()
    }

}

struct TransactionsList_Previews: PreviewProvider {
    static var previews: some View {
        TransactionsSection(predicate: Transaction.predicate(searchText: ""), sortDescriptor: TransactionSort(sortType: .amount, sortOrder: .ascending).sortDescriptor)
    }
}
