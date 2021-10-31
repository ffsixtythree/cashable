//
//  TabBar.swift
//  Cashable
//
//  Created by Umid Saidov on 30/10/21.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
        TabView {
            NavigationView {
                HomeView()
            }
            .tabItem {
                Label("Home", systemImage: "rectangle.3.group.fill")
            }
        }
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
