//
//  AccountDetailView.swift
//  Cashable
//
//  Created by Umid Saidov on 31/10/21.
//

import SwiftUI

struct AccountDetailView: View {
    var body: some View {
        List {
            Section {
                BalanceView()
            }
            Section {
                ForEach(0..<5) { _ in
                    TransactionRow(category: .food)
                }
            }
        }
    }
}

struct AccountDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AccountDetailView()
    }
}
