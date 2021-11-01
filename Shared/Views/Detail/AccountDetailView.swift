//
//  AccountDetailView.swift
//  Cashable
//
//  Created by Umid Saidov on 31/10/21.
//

import SwiftUI

struct AccountDetailView: View {
    
    var type: AccountType
    var amount: String
    
    var body: some View {
        List {
            Section {
                BalanceView(type: type, amount: amount)
            }
            Section {
                ForEach(Category.allCases) { category in
                    TransactionRow(category: category, amount: "2,000 UZS", date: "2 days ago")
                }
            }
        }
    }
}

struct AccountDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AccountDetailView(type: .balance, amount: "300,000 UZS")
    }
}
