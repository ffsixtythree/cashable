//
//  CashFlowView.swift
//  Cashable
//
//  Created by Umid Saidov on 29/10/21.
//

import SwiftUI

struct CashFlowView: View {
    
    var title: String
    var icon: Image
    var iconColor: Color
    var amount: Double
    var currency: String
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                VStack(alignment: .leading) {
                    HStack(spacing: 5) {
                        icon
                        Text(title)
                            .fontWeight(.medium)
                    }
                    .font(.subheadline)
                    .foregroundColor(iconColor)
                }
                VStack(alignment: .leading) {
                    Text("\(amount)")
                        .fontWeight(.bold)
                        .font(.title2)
                        .foregroundColor(.text)
                    Text(currency)
                        .fontWeight(.regular)
                        .font(.title2)
                        .foregroundColor(.text)
                        .padding(.bottom, -5)
                }
            }
            Spacer()
        }
        .padding(10)
        .background(Color.cell)
        .cornerRadius(10)
        .aspectRatio(2 / 1, contentMode: .fit)
    }
}

struct CashFlowView_Previews: PreviewProvider {
    static var previews: some View {
        CashFlowView(title: "EXPENSES", icon: Image(systemName: "arrow.down.circle.fill"), iconColor: Color.red, amount: 200, currency: "USD")
            .previewLayout(.sizeThatFits)
    }
}
