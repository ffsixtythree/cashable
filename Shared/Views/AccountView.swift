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
        ZStack {
            RoundedRectangle(cornerRadius: 10).fill(Color.white)
            HStack {
                VStack(alignment: .leading) {
                    icon
                        .renderingMode(.original)
                        .foregroundColor(iconColor)
                        .font(.system(size: 50))
                        .padding(.bottom, 5)
                    Text(title)
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundColor(.gray)
                    Spacer()
                    Text("\(amount)")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                    Text(currency)
                        .font(.title)
                        .fontWeight(.medium)
                        .foregroundColor(.primary)
                }
                Spacer()
            }
            .padding(20)
        }
        .aspectRatio(1 / 1, contentMode: .fill)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView(icon: Image(systemName: "creditcard.circle.fill"), iconColor: .blue, title: "BALANCE", amount: 2000, currency: "USD")
            .previewLayout(.sizeThatFits)
    }
}
