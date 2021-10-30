//
//  BudgetView.swift
//  Cashable
//
//  Created by Umid Saidov on 29/10/21.
//

import SwiftUI

struct BudgetView: View {
    
    var body: some View {
        List {
            Section {
                ForEach(0..<5) { _ in
                CategoryRow(title: "Fuel", icon: Image(systemName: "fuelpump.circle.fill"), amount: "20,000 UZS", type: .income)
                }
            } header: {
                HStack {
                    Text("Income")
                    Spacer()
                    Text("450,000 UZS")
                        .foregroundColor(.green)
                }
            }
            
            Section {
                ForEach(0..<5) { _ in
                    CategoryRow(title: "Fuel", icon: Image(systemName: "fuelpump.circle.fill"), amount: "20,000 UZS", type: .expense)
                }
            } header: {
                HStack {
                    Text("Expenses")
                    Spacer()
                    Text("450,000 UZS")
                        .foregroundColor(.red)
                }
            }
            
        }
        .navigationTitle("Budget")
#if os(iOS)
        .navigationBarTitleDisplayMode(.inline)
#endif
    }
}

struct BudgetView_Previews: PreviewProvider {
    static var previews: some View {
        BudgetView()
    }
}
