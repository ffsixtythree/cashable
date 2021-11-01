//
//  CashFlowRow.swift
//  Cashable
//
//  Created by Umid Saidov on 29/10/21.
//

import SwiftUI

struct CashFlowRow: View {
    
    @State private var isDetailShown: Int? = 0
    
    var incomeAmount: String
    var expensesAmount: String
    
    var body: some View {
        ZStack {
            NavigationLink(destination: CashFlowDetailView(), tag: 1, selection: $isDetailShown) {
                EmptyView()
            }
            NavigationLink(destination: CashFlowDetailView(), tag: 2, selection: $isDetailShown) {
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
        CashFlowRow(incomeAmount: "15,000", expensesAmount: "8,000")
    }
}
