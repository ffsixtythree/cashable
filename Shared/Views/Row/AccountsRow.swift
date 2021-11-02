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
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                NavigationLink(destination: AccountDetailView(type: .balance, amount: balanceAmount)) {
                    AccountView(type: .balance, amount: balanceAmount)
                }
                NavigationLink(destination: AccountDetailView(type: .main, amount: mainAmount)) {
                    AccountView(type: .main, amount: mainAmount)
                }
                NavigationLink(destination: AccountDetailView(type: .reserve, amount: reserveAmount)) {
                    AccountView(type: .reserve, amount: reserveAmount)
                }
            }
        }
        .listRowBackground(Color.clear)
        .listRowInsets(EdgeInsets())
    }
}

struct AccountsRow_Previews: PreviewProvider {
    static var previews: some View {
        AccountsRow(balanceAmount: 0, mainAmount: 0, reserveAmount: 0)
    }
}
