//
//  TransactionRow.swift
//  Cashable
//
//  Created by Umid Saidov on 30/10/21.
//

import SwiftUI

struct TransactionRow: View {
    
    var title: String
    var type: TransactionType
    var category: Category
    var amount: Double
    var date: String
    var onTapGesture: (() -> ())
    
    var body: some View {
        Button(action: {
            self.onTapGesture()
        }) {
            HStack {
                HStack(spacing: 10) {
                    CategoryImage(category: category)
                    VStack(alignment: .leading) {
                        Text(title)
                            .fontWeight(.medium)
                            .font(.body)
                            .foregroundColor(.text)
                        Text(date)
                            .font(.subheadline)
                            .fontWeight(.regular)
                            .foregroundColor(.gray)
                    }
                }
                Spacer()
                Text(amount.formattedCurrencyText)
                    .foregroundColor(type.color)
                    .font(.body)
                    .fontWeight(.regular)
                    .frame(width: 130, alignment: .trailing)
                    .lineLimit(1)
            }
            .padding(.top, 5)
            .padding(.bottom, 5)
        }
    }
}

struct TransactionRow_Previews: PreviewProvider {
    static var previews: some View {
        TransactionRow(title: "See", type: .expense, category: .food, amount: 0, date: "2 hours ago", onTapGesture: {})
            .previewLayout(.sizeThatFits)
    }
}
