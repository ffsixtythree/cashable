//
//  AccountsRow.swift
//  Cashable
//
//  Created by Umid Saidov on 29/10/21.
//

import SwiftUI

struct AccountsRow: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                AccountView(icon: Image(systemName: "creditcard.circle.fill"), iconColor: .red, title: "BALANCE", amount: 2000, currency: "USD")
                AccountView(icon: Image(systemName: "creditcard.circle.fill"), iconColor: .orange, title: "WALLET", amount: 2000, currency: "USD")
                AccountView(icon: Image(systemName: "creditcard.circle.fill"), iconColor: .green, title: "SAVINGS", amount: 2000, currency: "USD")
            }
        }
        .listRowBackground(Color.clear)
        .listRowInsets(EdgeInsets())
    }
}

struct AccountsRow_Previews: PreviewProvider {
    static var previews: some View {
        AccountsRow()
    }
}
