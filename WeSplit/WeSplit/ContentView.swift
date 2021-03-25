//
//  ContentView.swift
//  WeSplit
//
//  Created by Ognyanka Boneva on 23.03.21.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = 0
    @State private var numberOfPeople = 2
    @State private var tipPercentageIndex = 2
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var grandTotal: Double {
        let tipSelection = Double(tipPercentages[tipPercentageIndex])
        let orderAmount = Double(checkAmount)
        
        let tipValue = orderAmount / 100 * tipSelection
        return tipValue + orderAmount
    }
    
    var totalPerPerson: Double {
        grandTotal / Double(numberOfPeople)
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Amount")) {
                    TextField("", value: $checkAmount, formatter: NumberFormatter())
                        .keyboardType(.decimalPad)
                }
                
                
                Section(header: Text("Number of people ")) {
                    TextField("", value: $numberOfPeople, formatter: NumberFormatter())
                        .keyboardType(.decimalPad)
                }
                
                Section(header: Text("How much tip do you want to leave?")) {
                    Picker("Tip percentage", selection: $tipPercentageIndex) {
                        ForEach(0 ..< tipPercentages.count) {
                            Text("\(tipPercentages[$0])%")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Total amount")) {
                    Text("\(grandTotal, specifier: "%.2f")")
                }
                
                Section(header: Text("Amount per person")) {
                    Text("\(totalPerPerson, specifier: "%.2f")")
                }
            }
            .navigationBarTitle("WeSplit")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
