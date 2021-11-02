//
//  ContentView.swift
//  Shared
//
//  Created by Umid Saidov on 29/10/21.
//

import SwiftUI
import CoreData

struct ContentView: View {
#if os(iOS)
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass
#endif
    
    var body: some View {
#if os(iOS)
        if horizontalSizeClass == .compact {
            NavigationView {
                HomeView()
            }
        } else {
            NavigationView {
                SideBar()
                HomeView()
            }
            .navigationViewStyle(DoubleColumnNavigationViewStyle())
        }
#else
        NavigationView {
            SideBar()
            HomeView()
        }
#endif
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
