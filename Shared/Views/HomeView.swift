//
//  HomeView.swift
//  Cashable
//
//  Created by Umid Saidov on 29/10/21.
//

import SwiftUI
import CoreData

struct HomeView: View {
    
    @Environment(\.managedObjectContext)
    var context: NSManagedObjectContext
    
    @State private var searchText : String = ""
    @State private var isTransactionFormPresented: Bool = false
    
    var body: some View {
        List {
            Section {
                CashFlowRow(incomeAmount: 0, expensesAmount: 0)
            }
            Section {
                AccountsRow(balanceAmount: 0, mainAmount: 0, reserveAmount: 0)
            }
            Section {
                TransactionsSection(predicate: Transaction.predicate(searchText: searchText), sortDescriptor: TransactionSort(sortType: .date, sortOrder: .descending).sortDescriptor)
            }
            
        }
        .sheet(isPresented: $isTransactionFormPresented) {
            TransactionForm()
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
        .navigationTitle("Home")
#if os(iOS)
        .navigationBarTitleDisplayMode(.inline)
#endif
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
