//
//  CategoryView.swift
//  Cashable
//
//  Created by Umid Saidov on 30/10/21.
//

import SwiftUI

enum TransactionType {
    case income
    case expense
    
    var color: Color {
        switch self {
            case .income:
                return Color.green
            case .expense:
                return Color.red
        }
    }
}

struct CategoryRow: View {
    
    var title: String
    var icon: Image
    var amount: String
    var type: TransactionType
    
    var body: some View {
        HStack {
            HStack {
                icon
                    .renderingMode(.original)
                    .foregroundColor(type.color)
                    .font(.system(size: 40))
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
        CategoryRow(title: "Fuel", icon: Image(systemName: "fuelpump.circle.fill"), amount: "20,000 UZS", type: .income)
            .previewLayout(.sizeThatFits)
    }
}
