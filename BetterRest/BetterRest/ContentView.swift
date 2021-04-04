//
//  ContentView.swift
//  BetterRest
//
//  Created by Ognyanka Boneva on 4.04.21.
//

import SwiftUI

struct ContentView: View {
    @State private var hoursOfSleep = 8.0
    @State private var wakeUpAt = Date()
    
    var body: some View {
        Form {
            Stepper(value: $hoursOfSleep, in: 4...12, step: 0.25) {
                Text("\(hoursOfSleep, specifier: "%.2f") hours")
            }
            
            DatePicker("Please enter a date", selection: $wakeUpAt, displayedComponents: .hourAndMinute, in: Date()...)
                .labelsHidden()
        }
    }
    
//    func computeDate() {
//        let components = Calendar.current.dateComponents([.hour, .minute], from: someDate)
//        let hour = components.hour ?? 0
//        let minute = components.minute ?? 0
//        
//        
//    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
