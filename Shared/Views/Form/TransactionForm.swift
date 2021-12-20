//
//  TransactionForm.swift
//  Cashable
//
//  Created by Umid Saidov on 31/10/21.
//

import SwiftUI
import CoreData

struct TransactionForm: View {
    
    @Environment(\.managedObjectContext)
    var context: NSManagedObjectContext
    var transactionToEdit: Transaction?
    
    @State var type: TransactionType = .income
    @State var title: String = ""
    @State var amount: Double = 0
    @State var category: Category = .utilities
    @State var account: AccountType = .main
    @State var date: Date = Date()
    
    @FocusState var isTitleFocused: Bool
    
    @Environment(\.presentationMode)
    var presentationMode
    
    var navigationTitle: String {
        transactionToEdit == nil ? "New Transaction" : "Edit Transaction"
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("Transaction Type", selection: $type) {
                        Text("Income").tag(TransactionType.income)
                        Text("Expense").tag(TransactionType.expense)
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
                }
                Section {
                    DatePicker(selection: $date, in: ...Date(), displayedComponents: .date) {
                        Text("Date")
                    }
                }
                Section {
                    Picker("Category", selection: $category) {
                        ForEach(Category.allCases) { category in
                            Text(category.rawValue.capitalized).tag(category)
                        }
                    }
                }
                Section {
                    Picker("Account", selection: $account) {
                        Text(AccountType.main.rawValue.capitalized).tag(AccountType.main)
                        Text(AccountType.reserve.rawValue.capitalized).tag(AccountType.reserve)
                    }
                }
            }
            .multilineTextAlignment(.center)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                       onCancelTapped()
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        onSaveTapped()
                    }
                }
            }
#if os(iOS)
            .navigationBarTitleDisplayMode(.inline)
#endif
            .navigationTitle(navigationTitle)
        }
    }
}

extension TransactionForm {
    private func onCancelTapped() {
        self.presentationMode.wrappedValue.dismiss()
    }
    
    private func onSaveTapped() {
        let transaction: Transaction
        
        if let transactionToEdit = transactionToEdit {
            transaction = transactionToEdit
        } else {
            transaction = Transaction(context: context)
            transaction.id = UUID()
        }
        
        transaction.title = title
        transaction.typeEnum = type
        transaction.amount = NSDecimalNumber(value: amount)
        transaction.categoryEnum = category
        transaction.accountEnum = account
        transaction.date = date
        
        context.saveContext()
        
        self.presentationMode.wrappedValue.dismiss()
    }
}

struct TransactionForm_Previews: PreviewProvider {
    static var previews: some View {
        TransactionForm()
    }
}
