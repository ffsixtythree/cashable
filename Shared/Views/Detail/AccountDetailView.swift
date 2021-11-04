//
//  AccountDetailView.swift
//  Cashable
//
//  Created by Umid Saidov on 31/10/21.
//

import SwiftUI
import CoreData

struct AccountDetailView: View {
    
    @Environment(\.managedObjectContext)
    var context: NSManagedObjectContext
    
    @State private var isTransactionFormPresented: Bool = false
    
    var type: AccountType
    var amount: Double
    var transactions: FetchedResults<Transaction>
    
    var body: some View {
        List {
            Section {
                AccoundDetailHeaderView(type: type, amount: amount)
            }
            TransactionsSection(type: type, transactions: transactions)
        }
        .sheet(isPresented: $isTransactionFormPresented) {
            
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    isTransactionFormPresented = true
                } label: {
                    Image(systemName: "plus.circle.fill")
                }
            }
        }
    }
}
