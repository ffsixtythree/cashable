//
//  HomeView.swift
//  Cashable
//
//  Created by Umid Saidov on 29/10/21.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            List {
                Section {
                    AccountsRow()
                }
                Section {
                    CashFlowRow(incomeAmount: 1000, expensesAmount: 500, currency: "USD")
                }
                Section {
                    Text("First transaction")
                    Text("Second transaction")
                    Text("Third transaction")
                    Text("Fourth transaction")
                    Text("Fifth transaction")
                }
                
            }
            .ignoresSafeArea(edges: .bottom)
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Home")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
