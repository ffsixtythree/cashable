//
//  CashFlowRow.swift
//  Cashable
//
//  Created by Umid Saidov on 29/10/21.
//

import SwiftUI

struct CashFlowRow: View {
    
    @State private var isDetailShown: Int? = 0
    
    var incomeAmount: Double
    var expensesAmount: Double
    var currency: String
    
    var body: some View {
        ZStack {
            NavigationLink(destination: CashFlowDetailView(), tag: 1, selection: $isDetailShown) {
                EmptyView()
            }
            NavigationLink(destination: CashFlowDetailView(), tag: 2, selection: $isDetailShown) {
                EmptyView()
            }
            HStack(spacing: 10) {
                CashFlowView(title: "INCOME", icon: Image(systemName: "arrow.down.circle.fill"), iconColor: Color.green, amount: incomeAmount, currency: currency)
                    .onTapGesture {
                        self.isDetailShown = 1
                    }
                CashFlowView(title: "EXPENSES", icon: Image(systemName: "arrow.up.circle.fill"), iconColor: Color.red, amount: expensesAmount, currency: currency)
                    .onTapGesture {
                        self.isDetailShown = 2
                    }
            }
        }
        .listRowBackground(Color.clear)
        .listRowInsets(EdgeInsets())
    }
}

struct CashFlowRow_Previews: PreviewProvider {
    static var previews: some View {
        CashFlowRow(incomeAmount: 15000, expensesAmount: 8000, currency: "USD")
    }
}
