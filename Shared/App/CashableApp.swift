//
//  CashableApp.swift
//  Shared
//
//  Created by Umid Saidov on 29/10/21.
//

import SwiftUI

@main
struct CashableApp: App {
    let persistence = Persistence()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistence.viewContext)
        }
    }
}
