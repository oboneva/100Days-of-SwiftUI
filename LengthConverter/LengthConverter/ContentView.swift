//
//  ContentView.swift
//  LengthConverter
//
//  Created by Ognyanka Boneva on 26.03.21.
//

import SwiftUI

struct ContentView: View {
    enum LengthUnit: String, Identifiable, CaseIterable {
        var id: LengthUnit {
            return self
        }
        
        case m, km, ft, yd, mi
        
        var inMeters: Double {
            switch self {
            case .m: return 1
            case .km: return 1000
            case .ft: return 3.2808399
            case .yd: return 0.9144
            case .mi: return 1609.344
            }
        }
    }
    
    @State private var inputAmount = 0.0
    @State private var inputUnit = LengthUnit.m
    @State private var outputUnit = LengthUnit.m
    
    var lengthConverted: Double {
        let meters = Double(inputAmount) * inputUnit.inMeters
        return meters / outputUnit.inMeters
    }
    
    var body: some View {
        Form {
            Section(header: Text("Input")) {
                TextField("", value: $inputAmount, formatter: NumberFormatter())
            }
            
            Section(header: Text("Input unit")) {
                Picker("", selection: $inputUnit) {
                    ForEach(LengthUnit.allCases, id:\.id) { unit in
                        Text(unit.rawValue)
                            .tag(unit)
                    }
                }.pickerStyle(SegmentedPickerStyle())
            }
            
            
            Section(header: Text("Result unit")) {
                Picker("", selection: $outputUnit) {
                    ForEach(LengthUnit.allCases, id:\.id) { unit in
                        Text(unit.rawValue)
                            .tag(unit)
                    }
                }.pickerStyle(SegmentedPickerStyle())
            }
            
            Section(header: Text("Result")) {
                Text("\(lengthConverted, specifier: "%.2f")")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
