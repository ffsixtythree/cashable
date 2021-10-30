//
//  CardView.swift
//  Cashable
//
//  Created by Umid Saidov on 29/10/21.
//

import SwiftUI

struct AccountView: View {
    
    var icon: Image
    var iconColor: Color
    var title: String
    var amount: Double
    var currency: String
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 10) {
                VStack(alignment: .leading, spacing: 10) {
                    icon
                        .renderingMode(.original)
                        .foregroundColor(iconColor)
                        .font(.system(size: 40))
                    Text(title)
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundColor(.gray)
                }
                VStack(alignment: .leading) {
                    Text("\(amount)")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.text)
                    Text(currency)
                        .font(.title2)
                        .fontWeight(.regular)
                        .foregroundColor(.text)
                        .padding(.bottom, -5)
                }
            }
            Spacer()
        }
        .padding(20)
        .background(Color.cell)
        .cornerRadius(10)
        .aspectRatio(1 / 1, contentMode: .fill)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView(icon: Image(systemName: "creditcard.circle.fill"), iconColor: .blue, title: "BALANCE", amount: 0, currency: "USD")
            .previewLayout(.sizeThatFits)
    }
}
