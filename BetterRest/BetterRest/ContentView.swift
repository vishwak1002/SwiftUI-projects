//
//  ContentView.swift
//  BetterRest
//
//  Created by vishwasai.karnati on 30/07/23.
//

import SwiftUI
import CoreML
struct ContentView: View {
    @State var sleepAmount=8.0
    @State private var wakeUp = defaultWakeTime
    @State private var coffeeAmount = 1
    //    @State private var alertTitle = ""
    //    @State private var alertMessage = ""
    //    @State private var showingAlert = false
    private var bedtime:Date{
        return calculateBedTime()
    }
    static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? Date.now
    }
    
    //    var components=DateComponents();
    //    components.hour=8;
    //    components.minute=0;
    
    var body: some View {
        NavigationView{
            Form{
                //                VStack(alignment: .leading, spacing: 10) {
                Section{
                    DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                        .labelsHidden()
                }
            header: {
                Text("When do you want to wake up?")
                    .font(.headline)
            }
                //                }
                Section {
                    Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
                }
            header: {
                Text("Desired amount of sleep")
                    .font(.headline)
                
            }
                //                VStack(alignment: .leading, spacing: 0) {
                Section{
                    //                    Stepper(coffeeAmount == 1 ? "1 cup" : "\(coffeeAmount) cups", value: $coffeeAmount, in: 1...20)
                    Picker(coffeeAmount == 1 ? "1 cup" : "\(coffeeAmount) cups", selection: $coffeeAmount){
                        ForEach(1...20,id: \.self){
                            Text("\($0)")
                        }
                    }
                }header: {
                    Text("Daily coffee intake")
                        .font(.headline)
                }
                
                Section{
                    Text(bedtime.formatted(date: .omitted, time: .shortened))
                }header: {
                    Text("Your recommended BedTime is").font(.headline)
                }
                
                
            }
            .navigationBarTitle("BetterRest")
        }
        //                .toolbar {
        //                    Button("Calculate", action: calculateBedTime)
        //                }
        //                .alert(alertTitle, isPresented: $showingAlert) {
        //                    Button("OK") { }
        //                } message: {
        //                    Text(alertMessage)
        //                }
    }
    
    
    func calculateBedTime()->Date{
        do {
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            let hour = (components.hour ?? 0) * 60 * 60
            let minute = (components.minute ?? 0) * 60
            let prediction = try model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount))
            
            let sleepTime = wakeUp - prediction.actualSleep
            return sleepTime
            //            alertTitle = "Your ideal bedtime is…"
            //            alertMessage = sleepTime.formatted(date: .omitted, time: .shortened)
        } catch {
            return Date.now
            // something went wrong!
        }
        
        //        showingAlert = true
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
