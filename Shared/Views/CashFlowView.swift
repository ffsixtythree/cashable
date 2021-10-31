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
            VStack(alignment: .leading, spacing: 10) {
                HStack(spacing: 5) {
                    icon
                    Text(title)
                        .fontWeight(.medium)
                }
                .font(.subheadline)
                .foregroundColor(iconColor)
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
        CashFlowView(title: "EXPENSES", icon: Image(systemName: "arrow.down.circle.fill"), iconColor: Color.red, amount: 200, currency: "USD")
            .previewLayout(.sizeThatFits)
    }
}
