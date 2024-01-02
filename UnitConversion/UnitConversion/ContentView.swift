//
//  ContentView.swift
//  UnitConversion
//
//  Created by vishwasai.karnati on 06/07/23.
//

import SwiftUI

struct ContentView: View {
    @State private var inputUnit:String="mm"
    @State private var outputUnit:String="cm"
    @State private var inputValue=0.0
    @FocusState private var amountIsFocused:Bool
    
    
    private var units:[String]=["mm","cm","m","km"]
    var Outputvalue :Double{
        var value=inputValue
        switch(inputUnit){
        case "mm":
            value = Double(value)
        case "cm":
            value=value*10
        case "m" :
            value=value*1000
        case "km":
            value=value*1000000
            
        default:
            value=Double(value)
            
        }
        switch(outputUnit){
        case "mm":
            value = Double(value)
        case "cm":
            value=value/10
        case "m" :
            value=value/1000
        case "km":
            value=value/1000000
            
        default:
            value=Double(value)
            
        }
        return value
        
    }
    
    var body: some View {
        NavigationView{
            Form{
                Section{
                    Picker("Input Unit", selection: $inputUnit){
                        ForEach(units,id: \.self){
                            Text("\($0)")
                        }
                        
                    }.pickerStyle(.segmented)
                }header: {
                    Text("Please choose the input unit")
                }
                Section{
                    Picker("Output Unit", selection: $outputUnit){
                        ForEach(units,id: \.self){
                            Text("\($0)")
                        }
                        
                    }.pickerStyle(.segmented)
                }header: {
                    Text("Please choose the output  unit")
                }
                Section{
                    TextField("Value:", value: $inputValue,format: .number).focused($amountIsFocused)
                }header: {
                    Text("Select the value ")
                }
                
                Section{
                    Text(Outputvalue,format:.number)
                }
            header:{
                Text("The Value after conversion ")
            }

            }.navigationTitle("Unit conversion")
                .toolbar {
                    ToolbarItemGroup(placement: .keyboard) {
                        Spacer()
                        Button("Done") {
                            amountIsFocused = false
                        }
                    }
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
