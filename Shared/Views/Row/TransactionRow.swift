//
//  TransactionRow.swift
//  Cashable
//
//  Created by Umid Saidov on 30/10/21.
//

import SwiftUI

struct TransactionRow: View {
    
    var category: Category
    var amount: String
    var date: String
    
    var body: some View {
        HStack {
            HStack(spacing: 10) {
                CategoryImage(category: category)
                VStack(alignment: .leading) {
                    Text(category.rawValue.capitalized)
                        .fontWeight(.medium)
                        .font(.body)
                        .foregroundColor(Color("text"))
                    Text(date)
                        .font(.body)
                        .fontWeight(.regular)
                        .foregroundColor(.gray)
                }
            }
            Spacer()
            Text(amount)
                .foregroundColor(.green)
                .font(.body)
                .fontWeight(.regular)
                .frame(width: 130, alignment: .trailing)
                .lineLimit(1)
        }
        .padding(.top, 5)
        .padding(.bottom, 5)
    }
}

struct TransactionRow_Previews: PreviewProvider {
    static var previews: some View {
        TransactionRow(category: .food, amount: "5,000 UZS", date: "2 hours ago")
            .previewLayout(.sizeThatFits)
    }
}
