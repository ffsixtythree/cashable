//
//  HomeView.swift
//  Cashable
//
//  Created by Umid Saidov on 29/10/21.
//

import SwiftUI

struct HomeView: View {
    
    @State private var isTransactionFormPresented: Bool = false
    
    var body: some View {
        List {
            Section {
                CashFlowRow(incomeAmount: "1,500,000 UZS", expensesAmount: "500,000 UZS")
            }
            Section {
                AccountsRow()
            }
            Section {
                ForEach(Category.allCases) { category in
                    TransactionRow(category: category, amount: "2,000 UZS", date: "2 days ago")
                }
            }
            
        }
        .sheet(isPresented: $isTransactionFormPresented) {
            TransactionForm()
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    isTransactionFormPresented = true
                } label: {
                    Image(systemName: "plus.circle.fill")
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
