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
    
    @State var transactionToEdit: Transaction?
    
    @FetchRequest(fetchRequest: Transaction.fetchAllTransactions())
    var transactions: FetchedResults<Transaction>
    
    var body: some View {
        List {
            Section {
                CashFlowRow(incomeAmount: getIncomeAmount(), expensesAmount: getExpenseAmount())
            }
            Section {
                AccountsRow(balanceAmount: getBalanceAmount(), mainAmount: getAccountAmount(account: .main), reserveAmount: getAccountAmount(account: .reserve))
            }
            Section {
                TransactionsSection(transactions: transactions)
            }
            
        }
        .sheet(isPresented: $isTransactionFormPresented, onDismiss: {
            
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
    func getIncomeAmount() -> Double {
        return transactions.filter({$0.type == 0}).reduce(0) {
            Double($0 + Double(truncating: $1.amount))
        }
    }
    func getExpenseAmount() -> Double {
        return transactions.filter({$0.type == 1}).reduce(0) {
            Double($0 + Double(truncating: $1.amount))
        }
    }
    func getBalanceAmount() -> Double {
        return getIncomeAmount() - getExpenseAmount()
    }
    func getAccountAmount(account: AccountType) -> Double {
        let accountIncome = transactions.filter({$0.type == 0 && $0.account == account.rawValue}).reduce(0) {
            Double($0 + Double(truncating: $1.amount))
        }
        let accountExpenses = transactions.filter({$0.type == 1 && $0.account == account.rawValue}).reduce(0) {
            Double($0 + Double(truncating: $1.amount))
        }
        return accountIncome - accountExpenses
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
