//
//  AddView.swift
//  iExpense
//
//  Created by Ognyanka Boneva on 15.04.21.
//

import SwiftUI

struct AddView: View {
    @ObservedObject var expenses: Expenses
    @Environment(\.presentationMode) var presentationMode
    
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = ""
    
    @State private var showingInvalidAmountAlert = false 
    
    static let types = ["Business", "Personal"]
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)
                
                Picker("Type", selection: $type) {
                    ForEach(Self.types, id:\.self) {
                        Text($0)
                    }
                }
                
                TextField("Amount", text: $amount)
                    .keyboardType(.numberPad)
            }
            .navigationBarTitle("Add new expense")
            .navigationBarItems(trailing: Button("Save") {
                if let amount = Int(self.amount) {
                    let item = ExpenseItem(name: self.name, type: self.type, amount: amount)
                    self.expenses.items.append(item)
                    self.presentationMode.wrappedValue.dismiss()
                } else {
                    self.showingInvalidAmountAlert = true
                }
            })
            .alert(isPresented: $showingInvalidAmountAlert) {
                Alert(title: Text("Invalid amount"),
                      message: Text("Enter valid number"),
                      dismissButton: .default(Text("OK"))
                )
            }
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(expenses: Expenses())
    }
}
