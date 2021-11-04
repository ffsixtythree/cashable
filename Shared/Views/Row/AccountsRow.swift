//
//  AccountsRow.swift
//  Cashable
//
//  Created by Umid Saidov on 29/10/21.
//

import SwiftUI
import CoreData

struct AccountsRow: View {
    
    @Environment(\.managedObjectContext)
    var context: NSManagedObjectContext
    
    var balanceAmount: Double
    var mainAmount: Double
    var reserveAmount: Double
    var transactions: FetchedResults<Transaction>
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                NavigationLink(destination: AccountDetailView(type: .balance, amount: balanceAmount, transactions: transactions)) {
                    AccountView(type: .balance, amount: balanceAmount)
                }
                NavigationLink(destination: AccountDetailView(type: .main, amount: mainAmount, transactions: transactions)) {
                    AccountView(type: .main, amount: mainAmount)
                }
                NavigationLink(destination: AccountDetailView(type: .reserve, amount: reserveAmount, transactions: transactions)) {
                    AccountView(type: .reserve, amount: reserveAmount)
                }
            }
        }
        .listRowBackground(Color.clear)
        .listRowInsets(EdgeInsets())
    }
}
