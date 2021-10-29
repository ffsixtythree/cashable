//
//  CashableApp.swift
//  Shared
//
//  Created by Umid Saidov on 29/10/21.
//

import SwiftUI

@main
struct CashableApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
