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
