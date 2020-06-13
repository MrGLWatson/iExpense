//
//  ContentView.swift
//  iExpense
//
//  Created by Gary Watson on 13/06/2020.
//  Copyright © 2020 Gary Watson. All rights reserved.
//

import SwiftUI

struct User: Codable {
    var firstName: String
    var lastName: String
}

struct ContentView: View {
    @State private var user = User(firstName: "Taylor", lastName: "Swift")
    
    var body: some View {
        Button("Save User") {
            let encodder = JSONEncoder()
            
            if let data = try? encodder.encode(self.user) {
                UserDefaults.standard.set(data, forKey: "UserData")
            }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
