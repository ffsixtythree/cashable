//
//  CashFlowDetailView.swift
//  Cashable
//
//  Created by Umid Saidov on 31/10/21.
//

import SwiftUI
import CoreData

struct CashFlowDetailView: View {
    
    @Environment(\.managedObjectContext)
    var context: NSManagedObjectContext
    
    @State private var isTransactionFormPresented: Bool = false
    @State private var categoriesSum: [CategorySum]?
    
    var type: TransactionType
    var amount: Double
    
    var body: some View {
        List {
            Section {
                CashFlowDetailHeaderView(type: type, amount: amount)
            }
            Section {
                if let categoriesSum = categoriesSum {
                    ForEach(categoriesSum.sorted(by: >)) {
                        CategoryRow(type: type, category: $0.category, amount: $0.sum)
                    }
                }
            }
        }
        .sheet(isPresented: $isTransactionFormPresented) {
            
        }
        .onAppear(perform: fetchTotalSums)
    }
}

extension CashFlowDetailView {
    func fetchTotalSums() {
        Transaction.fetchAllCategoriesTotalAmountSum(context: self.context) { (results) in
            guard !results.isEmpty else { return }
            
            self.categoriesSum = results.map { (result) -> CategorySum in
                return CategorySum(sum: result.sum, category: result.category)
            }
            
        }
    }
}

struct CashFlowDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CashFlowDetailView(type: .expense, amount: 0)
    }
}
