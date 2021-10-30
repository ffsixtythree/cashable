//
//  SideBar.swift
//  Cashable
//
//  Created by Umid Saidov on 30/10/21.
//

import SwiftUI

struct SideBar: View {
    var body: some View {
        List {
            NavigationLink(destination: HomeView()) {
                Label("Home", systemImage: "rectangle.3.group.fill")
            }
            NavigationLink(destination: BudgetView()) {
                Label("Budget", systemImage: "chart.bar.xaxis")
            }
        }
        .listStyle(.sidebar)
        .navigationTitle("Cashable")
    }
}

struct SideBar_Previews: PreviewProvider {
    static var previews: some View {
        SideBar()
    }
}
