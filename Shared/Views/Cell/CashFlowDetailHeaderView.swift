//
//  CashFlowDetailHeaderView.swift
//  Cashable
//
//  Created by Umid Saidov on 01/11/21.
//

import SwiftUI

struct CashFlowDetailHeaderView: View {
    
    var type: TransactionType
    var amount: Double
    
    var body: some View {
        HStack {
            Spacer()
            VStack(alignment: .center, spacing: 10) {
                CashFlowImage(type: type, width: 40, padding: 20)
                Text(type.title.capitalized)
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

struct CashFlowDetailHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        CashFlowDetailHeaderView(type: .expense, amount: 0)
    }
}
