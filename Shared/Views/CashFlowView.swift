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
        ZStack {
            RoundedRectangle(cornerRadius: 10).fill(Color.cell)
            HStack {
                VStack(alignment: .leading) {
                    HStack(spacing: 5) {
                        icon
                        Text(title)
                            .fontWeight(.medium)
                    }
                    .font(.subheadline)
                    .foregroundColor(iconColor)
                    Spacer()
                    Text("\(amount)")
                        .fontWeight(.bold)
                        .font(.title2)
                        .foregroundColor(.white)
                    Text(currency)
                        .fontWeight(.regular)
                        .font(.title2)
                        .foregroundColor(.white)
                        .padding(.bottom, -5)
                }
                Spacer()
            }
            .padding(10)
        }
        .aspectRatio(2 / 1, contentMode: .fit)
    }
}

struct CashFlowView_Previews: PreviewProvider {
    static var previews: some View {
        CashFlowView(title: "EXPENSES", icon: Image(systemName: "arrow.down.circle.fill"), iconColor: Color.red, amount: 200, currency: "USD")
            .previewLayout(.sizeThatFits)
    }
}
