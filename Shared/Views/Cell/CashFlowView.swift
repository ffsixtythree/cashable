//
//  CashFlowView.swift
//  Cashable
//
//  Created by Umid Saidov on 29/10/21.
//

import SwiftUI

struct CashFlowView: View {
    
    var type: TransactionType
    var amount: Double
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 10) {
                HStack(spacing: 5) {
                    Image(systemName: type.systemNameIcon)
                    Text(type.title)
                        .fontWeight(.medium)
                }
                .font(.subheadline)
                .foregroundColor(type.color)
                Text(amount.formattedCurrencyText)
                    .fontWeight(.bold)
                    .font(.body)
                    .foregroundColor(Color("text"))
            }
            Spacer()
        }
        .lineLimit(1)
        .padding(20)
        .background(Color("cell"))
        .cornerRadius(10)
    }
}

struct CashFlowView_Previews: PreviewProvider {
    static var previews: some View {
        CashFlowView(type: .income, amount: 0)
            .previewLayout(.sizeThatFits)
    }
}
