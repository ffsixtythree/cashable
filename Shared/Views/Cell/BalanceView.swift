//
//  BalanceView.swift
//  Cashable
//
//  Created by Umid Saidov on 31/10/21.
//

import SwiftUI

struct BalanceView: View {
    
    var type: AccountType
    var amount: String
    
    var body: some View {
        HStack {
            Spacer()
            VStack(alignment: .center, spacing: 10) {
                AccountImage(type: type, width: 30, padding: 15)
                Text(type.rawValue.capitalized)
                    .font(.title)
                    .fontWeight(.medium)
                    .foregroundColor(type.color)
                VStack(alignment: .leading) {
                    Text(amount)
                        .font(.title)
                        .fontWeight(.bold)
                }
            }
            Spacer()
        }
        .padding(20)
        .background(Color("cell"))
        .cornerRadius(10)
    }
}

struct BalanceView_Previews: PreviewProvider {
    static var previews: some View {
        BalanceView(type: .balance, amount: "20,000 UZS")
    }
}