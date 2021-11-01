//
//  CashFlowDetailHeaderView.swift
//  Cashable
//
//  Created by Umid Saidov on 01/11/21.
//

import SwiftUI

struct CashFlowDetailHeaderView: View {
    
    var type: TransactionType
    var amount: String
    
    var body: some View {
        HStack {
            Spacer()
            VStack(alignment: .center, spacing: 10) {
                Image(systemName: type.systemNameIcon)
                    .font(.system(size: 50))
                    .foregroundColor(type.color)
                Text(type.title.capitalized)
                    .font(.title)
                    .fontWeight(.medium)
                    .foregroundColor(type.color)
                VStack(alignment: .leading) {
                    Text(amount)
                        .font(.title)
                        .fontWeight(.semibold)
                }
            }
            Spacer()
        }
        .padding(20)
        .background(Color("cell"))
        .cornerRadius(10)
    }
}

struct CashFlowDetailHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        CashFlowDetailHeaderView(type: .expense, amount: "20,000 UZS")
    }
}
