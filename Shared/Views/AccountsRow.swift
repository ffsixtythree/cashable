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
                ForEach(AccountType.allCases, id: \.id) { type in
                    AccountView(type: type)
                }
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
