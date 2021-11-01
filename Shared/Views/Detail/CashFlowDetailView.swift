//
//  CashFlowDetailView.swift
//  Cashable
//
//  Created by Umid Saidov on 31/10/21.
//

import SwiftUI

struct CashFlowDetailView: View {
    
    var body: some View {
        List {
            Section {
                
            }
            Section {
                ForEach(0..<10) { _ in
                    CategoryRow()
                }
            }
        }
    }
}

struct CashFlowDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CashFlowDetailView()
    }
}
