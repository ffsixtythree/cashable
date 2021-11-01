//
//  TransactionForm.swift
//  Cashable
//
//  Created by Umid Saidov on 31/10/21.
//

import SwiftUI

struct TransactionForm: View {
    
    @State var type: TransactionType = .income
    @State var title: String = ""
    @State var amount: Double = 0
    @State var category: Category = .utilities
    @State var account: AccountType = .main
    @State var date: Date = Date()
    @FocusState private var isTitleFocused: Bool
    
    @Environment(\.presentationMode)
    var presentationMode
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("Transaction Type", selection: $type) {
                        ForEach(TransactionType.allCases) { type in
                            Text(type.rawValue.capitalized).tag(type)
                        }
                    }
                    .pickerStyle(.segmented)
                    .listRowBackground(Color.clear)
                    .listRowInsets(EdgeInsets())
                }
                Section {
                    TextField("Title", text: $title)
                        .disableAutocorrection(true)
                        .focused($isTitleFocused)
                    TextField("Amount", value: $amount, formatter: Utils.numberFormatter)
                        .foregroundColor(type.color)
                        .keyboardType(.decimalPad)
                    Picker("Category", selection: $category) {
                        ForEach(Category.allCases) { category in
                            Text(category.rawValue.capitalized).tag(category)
                        }
                    }
                    .pickerStyle(.menu)
                    DatePicker(selection: $date, displayedComponents: .date) {
                        Text("Date")
                    }
                }
                Section {
                    Picker("Account", selection: $account) {
                        Text(AccountType.main.rawValue.capitalized).tag(AccountType.main)
                        Text(AccountType.reserve.rawValue.capitalized).tag(AccountType.reserve)
                    }
                    
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        self.presentationMode.wrappedValue.dismiss()
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        self.presentationMode.wrappedValue.dismiss()
                    }
                }
            }
#if os(iOS)
            .navigationBarTitleDisplayMode(.inline)
#endif
            .navigationTitle("New Transaction")
        }
    }
}

struct TransactionForm_Previews: PreviewProvider {
    static var previews: some View {
        TransactionForm()
    }
}
