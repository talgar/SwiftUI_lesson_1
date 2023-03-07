//
//  AddView.swift
//  learnSwiftUI
//
//  Created by Talgar on 27/2/23.
//

import SwiftUI

enum Types {
    case bussines
    case personal
}

struct AddView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var expense: Expenses
    @State private var name = ""
    @State private var type = ""
    @State private var amount = ""
    
    let types = ["Bussines","Personal"]
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Название", text: $name)
                TextField("Стоимость", text: $amount)
                    .keyboardType(.numberPad)
                
                Picker("Type",
                       selection: $type) {
                    ForEach(self.types, id: \.self){
                        Text($0)
                    }
                }
            }
            .navigationTitle("koko")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                Button(action: {
                    if let amount = Int(self.amount) {
                        let item = ExpenseItem(name: self.name,
                                                  type: self.type,
                                                  amount: amount)
                        self.expense.items.append(item)
                        self.presentationMode.wrappedValue.dismiss()
                    }
                }){
                    Text("save")
                    Spacer()
                }
            }
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(expense: Expenses())
    }
}
