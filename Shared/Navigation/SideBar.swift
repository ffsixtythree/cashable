//
//  SideBar.swift
//  Cashable
//
//  Created by Umid Saidov on 30/10/21.
//

import SwiftUI
import CoreData

struct SideBar: View {
    
    @State private var selectedTab: Tab? = .home

    var body: some View {
        List {
            NavigationLink(destination: HomeView(), tag: Tab.home, selection: $selectedTab) {
                Label("Home", systemImage: "rectangle.3.group.fill")
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
