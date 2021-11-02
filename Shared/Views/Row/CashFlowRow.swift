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
    
    var body: some View {
        ZStack {
            NavigationLink(destination: CashFlowDetailView(type: .income, amount: incomeAmount), tag: 1, selection: $isDetailShown) {
                EmptyView()
            }
            NavigationLink(destination: CashFlowDetailView(type: .expense, amount: expensesAmount), tag: 2, selection: $isDetailShown) {
                EmptyView()
            }
            HStack(spacing: 10) {
                CashFlowView(type: .income, amount: incomeAmount)
                    .onTapGesture {
                        self.isDetailShown = 1
                    }
                CashFlowView(type: .expense, amount: expensesAmount)
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
        CashFlowRow(incomeAmount: 0, expensesAmount: 0)
    }
}
