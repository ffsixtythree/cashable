//
//  CashFlowView.swift
//  Cashable
//
//  Created by Umid Saidov on 29/10/21.
//

import SwiftUI

struct CashFlowView: View {
    
    var type: TransactionType
    var title: String {
        switch type {
            case .income:
                return "INCOME"
            case .expense:
                return "EXPENSES"
        }
    }
    var amount: Double
    var currency: String
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 10) {
                HStack(spacing: 5) {
                    Image(systemName: type.systemNameIcon)
                    Text(title)
                        .fontWeight(.medium)
                }
                .font(.subheadline)
                .foregroundColor(type.color)
                VStack(alignment: .leading) {
                    Text("\(amount)")
                        .fontWeight(.bold)
                        .font(.title2)
                        .foregroundColor(Color("text"))
                    Text(currency)
                        .fontWeight(.regular)
                        .font(.title2)
                        .foregroundColor(Color("text"))
                }
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
        CashFlowView(type: .income, amount: 20, currency: "USD")
            .previewLayout(.sizeThatFits)
    }
}
