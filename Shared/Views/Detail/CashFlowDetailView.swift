//
//  CashFlowDetailView.swift
//  Cashable
//
//  Created by Umid Saidov on 31/10/21.
//

import SwiftUI

struct CashFlowDetailView: View {
    
    @State private var isTransactionFormPresented: Bool = false
    
    var type: TransactionType
    var amount: String
    
    var body: some View {
        List {
            Section {
                CashFlowDetailHeaderView(type: type, amount: amount)
            }
            Section {
                ForEach(Category.allCases) { category in
                    CategoryRow(category: category, amount: "234,000 UZS")
                }
            }
        }
        .sheet(isPresented: $isTransactionFormPresented) {
            
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
    }
}

struct CashFlowDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CashFlowDetailView(type: .expense, amount: "20,000 UZS")
    }
}
