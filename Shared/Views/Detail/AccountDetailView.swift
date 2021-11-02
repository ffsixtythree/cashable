//
//  AccountDetailView.swift
//  Cashable
//
//  Created by Umid Saidov on 31/10/21.
//

import SwiftUI

struct AccountDetailView: View {
    
    @State private var isTransactionFormPresented: Bool = false
    
    var type: AccountType
    var amount: String
    
    var body: some View {
        List {
            Section {
                AccoundDetailHeaderView(type: type, amount: amount)
            }
            Section {
                ForEach(Category.allCases) { category in
                    
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

struct AccountDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AccountDetailView(type: .balance, amount: "300,000 UZS")
    }
}
