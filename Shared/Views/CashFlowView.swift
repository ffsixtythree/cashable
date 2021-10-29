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
    var color: Color
    var amount: Double
    var currency: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10).fill(color)
            HStack {
                VStack(alignment: .leading, spacing: 10) {
                    Label {
                        Text(title)
                            .font(.headline)
                            .fontWeight(.medium)
                            .foregroundColor(.white)
                    } icon: {
                        icon
                            .font(.headline)
                            .foregroundColor(.white)
                    }
                    VStack(alignment: .leading) {
                        Text("\(amount)")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                           
                        Text(currency)
                            .font(.title)
                            .fontWeight(.medium)
                            .foregroundColor(.white)
                    }
                }
                Spacer()
            }
            .padding()
        }
        .aspectRatio(contentMode: .fit)
    }
}

struct CashFlowView_Previews: PreviewProvider {
    static var previews: some View {
        CashFlowView(title: "EXPENSES", icon: Image(systemName: "arrow.down.circle.fill"), color: Color.red, amount: 2000, currency: "USD")
            .previewLayout(.sizeThatFits)
    }
}
