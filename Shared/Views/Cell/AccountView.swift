//
//  CardView.swift
//  Cashable
//
//  Created by Umid Saidov on 29/10/21.
//

import SwiftUI

struct AccountView: View {
    
    var type: AccountType
    var amount: Double
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 10) {
                AccountImage(type: type, width: 20, padding: 10)
                Text(type.rawValue.capitalized)
                    .font(.body)
                    .fontWeight(.medium)
                    .foregroundColor(.text)
                Text(amount.formattedCurrencyText)
                    .font(.body)
                    .fontWeight(.bold)
                    .foregroundColor(.text)
            }
            Spacer()
        }
        .padding(20)
        .background(Color.cell)
        .cornerRadius(10)
        .aspectRatio(1.5 / 1, contentMode: .fill)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView(type: .balance, amount: 0)
            .previewLayout(.sizeThatFits)
    }
}
