//
//  HomeView.swift
//  Cashable
//
//  Created by Umid Saidov on 29/10/21.
//

import SwiftUI

struct HomeView: View {
    
    var body: some View {
        List {
            Section {
                CashFlowRow(incomeAmount: "1,500,000 UZS", expensesAmount: "500,000 UZS")
            }
            Section {
                AccountsRow()
            }
            Section {
                ForEach(0..<5) { _ in
                    TransactionRow(category: .food)
                }
            }
            
        }
        .navigationTitle("Home")
#if os(iOS)
        .navigationBarTitleDisplayMode(.inline)
#endif
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
