//
//  BalanceView.swift
//  Cashable
//
//  Created by Umid Saidov on 31/10/21.
//

import SwiftUI

struct AccoundDetailHeaderView: View {
    
    var type: AccountType
    var amount: Double
    
    var body: some View {
        HStack {
            Spacer()
            VStack(alignment: .center, spacing: 10) {
                AccountImage(type: type, width: 40, padding: 20)
                Text(type.rawValue.capitalized)
                    .font(.title)
                    .fontWeight(.medium)
                    .foregroundColor(type.color)
                VStack(alignment: .leading) {
                    Text(amount.formattedCurrencyText)
                        .font(.title)
                        .fontWeight(.semibold)
                }
            }
            Spacer()
        }
        .listRowBackground(Color.clear)
        .listRowInsets(EdgeInsets())
        .cornerRadius(10)
    }
}

struct AccoundDetailHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        AccoundDetailHeaderView(type: .balance, amount: 0)
    }
}
