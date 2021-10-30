//
//  SideBar.swift
//  Cashable
//
//  Created by Umid Saidov on 30/10/21.
//

import SwiftUI

enum Tab {
    case home
    case budget
}

struct SideBar: View {
    
    @State private var selectedTab: Tab?
    
    var body: some View {
        List {
            NavigationLink(destination: HomeView(), tag: Tab.home, selection: $selectedTab) {
                Label("Home", systemImage: "rectangle.3.group.fill")
            }
            NavigationLink(destination: BudgetView(), tag: Tab.budget, selection: $selectedTab) {
                Label("Budget", systemImage: "chart.bar.xaxis")
            }
        }
        .onAppear {
            selectedTab = .home
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
