//
//  CategoryView.swift
//  Cashable
//
//  Created by Umid Saidov on 30/10/21.
//

import SwiftUI

struct CategoryRow: View {
    
    var title: String
    var category: Category
    var amount: String
    var type: TransactionType
    
    var body: some View {
        HStack {
            HStack(spacing: 10) {
                CategoryImage(category: .shopping)
                Text(title)
                    .fontWeight(.semibold)
                    .font(.body)
                    .foregroundColor(Color("text"))
            }
            Spacer()
            Text(amount)
                .foregroundColor(type.color)
                .font(.body)
                .fontWeight(.semibold)
                .frame(width: 130, alignment: .trailing)
                .lineLimit(1)
        }
        .padding(.top, 10)
        .padding(.bottom, 10)
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryRow(title: "Fuel", category: .entertainment, amount: "20,000 UZS", type: .income)
            .previewLayout(.sizeThatFits)
    }
}
