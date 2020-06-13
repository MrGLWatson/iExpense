//
//  ContentView.swift
//  iExpense
//
//  Created by Gary Watson on 13/06/2020.
//  Copyright © 2020 Gary Watson. All rights reserved.
//

import SwiftUI



struct ContentView: View {
    @State private var numbers = [Int]()
    @State private var currentNumber =  1
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(numbers, id:\.self) {
                        Text("\($0)")
                        
                    }
                    .onDelete(perform: removeRows)
                }
                
                Button("Add Number") {
                    self.numbers.append(self.currentNumber)
                    self.currentNumber += 1
                }
            }
        .navigationBarItems(leading: EditButton())
        }
    }
    func removeRows(at offsets: IndexSet) {
        numbers.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
