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
    
    @State private var incomeAmount: Double?
    @State private var expensesAmount: Double?
    @State private var balanceAmount: Double?
    @State private var mainAmount: Double?
    @State private var reserveAmount: Double?
    
    var body: some View {
        List {
            Section {
                CashFlowRow(incomeAmount: incomeAmount ?? 0, expensesAmount: expensesAmount ?? 0)
                    .onAppear {
                        fetchExpenseAmount()
                        fetchIncomeAmount()
                    }
            }
            Section {
                AccountsRow(balanceAmount: balanceAmount ?? 0, mainAmount: mainAmount ?? 0, reserveAmount: reserveAmount ?? 0)
            }
            Section {
                TransactionsSection(predicate: Transaction.predicate(searchText: searchText), sortDescriptor: TransactionSort(sortType: .date, sortOrder: .descending).sortDescriptor)
            }
            
        }
        .sheet(isPresented: $isTransactionFormPresented, onDismiss: {
            fetchExpenseAmount()
            fetchIncomeAmount()
        }) {
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

extension HomeView {
    func fetchExpenseAmount() {
            Transaction.fetchAllCategoriesExpensesAmount(context: self.context) { (results) in
                guard !results.isEmpty else { return }
                
                let expensesSum = results.map { $0.sum }.reduce(0, +)
                self.expensesAmount = expensesSum
            }
        }
    func fetchIncomeAmount() {
            Transaction.fetchAllCategoriesIncomeAmount(context: self.context) { (results) in
                guard !results.isEmpty else { return }
                
                let incomeAmount = results.map { $0.sum }.reduce(0, +)
                self.incomeAmount = incomeAmount
            }
        }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
