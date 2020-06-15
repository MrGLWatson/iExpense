//
//  AddView.swift
//  iExpense
//
//  Created by Gary Watson on 14/06/2020.
//  Copyright © 2020 Gary Watson. All rights reserved.
//

import SwiftUI
extension String: Error {}

struct AddView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @ObservedObject var expenses: Expenses 
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = ""
    @State private var showingAlert = false
    
    
    static let types = ["Business", "Personal"]
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)
                Picker("Type", selection: $type) {
                    ForEach(Self.types, id: \.self) {
                        Text($0)
                    }
                }
                TextField("Amount", text: $amount)
                    .keyboardType(.numberPad)
                
            }
            .navigationBarTitle("Add new expense")
            .navigationBarItems(trailing: Button("Save") {
                do {
                if let actualAmount = Int(self.amount)
                {
                    let item = ExpenseItem(name: self.name, type: self.type, amount: actualAmount)
                    self.expenses.items.append(item)
                    self.presentationMode.wrappedValue.dismiss()
                } else {
                    throw "Error"
                    }
                }
                catch {
                    self.amount = ""
                    self.showingAlert = true
                }
            })
                .alert(isPresented: $showingAlert) {
                    Alert(title: Text("Not a number"),message: Text("Enter again"), dismissButton: .default(Text("OK")))
            
            }
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(expenses: Expenses())
    }
}
