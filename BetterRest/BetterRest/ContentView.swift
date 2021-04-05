//
//  ContentView.swift
//  BetterRest
//
//  Created by Ognyanka Boneva on 4.04.21.
//

import SwiftUI

struct ContentView: View {
    @State private var hoursOfSleep = 8.0
    @State private var wakeUpAt = defaultWakeTime
    @State private var coffeeAmount = 1
    
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showingAlert = false
    
    static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? Date()
    }
    
    var body: some View {        
        NavigationView {
            Form {
                Text("When do you want to wake up?")
                    .font(.headline)
                
                DatePicker("Please enter a time", selection: $wakeUpAt, displayedComponents: .hourAndMinute)
                    .labelsHidden()
                    .datePickerStyle(WheelDatePickerStyle())
                
                VStack(alignment: .leading, spacing: 0) {
                    Text("Desired amount of sleep")
                        .font(.headline)

                    Stepper(value: $hoursOfSleep, in: 4...12, step: 0.25) {
                        Text("\(hoursOfSleep, specifier: "%g") hours")
                    }
                }
                
                VStack(alignment: .leading, spacing: 0) {
                    Text("Daily coffee intake")
                        .font(.headline)
                    
                    Stepper(value: $coffeeAmount, in: 1...20) {
                        coffeeAmount == 1 ?
                            Text("1 cup") :
                            Text("\(coffeeAmount) cups")
                    }
                }
            }
            .navigationBarTitle(Text("BetterRest"))
            .navigationBarItems(trailing:
                Button(action: calculateBedtime) {
                    Text("Calculate")
                }
            )
        }
        .alert(isPresented: $showingAlert) {
            Alert(title: Text(alertTitle), message: Text(alertMessage), dismissButton: .default(Text("OK")))
        }
    }
    
    func calculateBedtime() {
        let sleepCalculator = SleepCalculator()
        
        let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUpAt)
        let hour = (components.hour ?? 0) * 60 * 60
        let minute = (components.minute ?? 0) * 60
        
        do {
            let prediction = try sleepCalculator.prediction(wake: Double(hour + minute), estimatedSleep: hoursOfSleep, coffee: Double(coffeeAmount))

            let sleepTime = wakeUpAt - prediction.actualSleep
            
            let formatter = DateFormatter()
            formatter.timeStyle = .short

            alertMessage = formatter.string(from: sleepTime)
            alertTitle = "Your ideal bedtime is…"
        } catch {
            alertTitle = "Error"
            alertMessage = "Sorry, there was a problem calculating your bedtime."
        }
        showingAlert = true
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
