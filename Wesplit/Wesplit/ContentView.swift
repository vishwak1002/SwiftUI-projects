//
//  ContentView.swift
//  Wesplit
//
//  Created by vishwasai.karnati on 04/07/23.
//

import SwiftUI

struct ContentView: View {
//   @State private  var name = ""
    @State private var numOfPeople=0
    @State private var checkAmount=0.0
    @State private var tipPercentage=20
//    @State private var red=false
    @FocusState private var amountIsFocused:Bool
    var totalAmount:Double{
        return (checkAmount + (checkAmount / 100) * Double(tipPercentage))
    }
    private var currencyCode:FloatingPointFormatStyle<Double>.Currency = .currency(code:Locale.current.currency?.identifier ??  "USD")
    var totalPerPerson:Double{
//        let peopleCount = Double(numberOfPeople + 2)
//        let tipSelection = Double(tipPercentage)
//        let tipValue = checkAmount / 100 * tipSelection
//        let grandTotal = checkAmount + tipValue
//        let amountPerPerson = grandTotal / peopleCount

        return totalAmount/Double(numOfPeople + 2)
    }
    let tipPercentages=[0,5,10,15,20,25]
//
//
    var body: some View {
        NavigationView{
            Form{
                Section{
                    TextField("Amount ", value: $checkAmount,format:currencyCode).keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                    Picker("Number of people",selection: $numOfPeople){
                        ForEach(2..<11){
                            Text("\($0) People")
                            
                        }
                        
                    }
                }
                Section{
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(0..<101, id: \.self) {
                                Text($0, format: .percent)
                            }
                    }
//                    .pickerStyle(.segmented)
                }
            header: {
                    Text("Select the tip amount percentage?")
                }
                Section{
                    Text(totalAmount,format:.currency(code:Locale.current.currency?.identifier ??  "USD"))
                        .foregroundColor(tipPercentage == 0 ? .red : .black)
                }
            header:{
                Text("Total Amount after adding tip")
            }
                            Section {
                                Text(totalPerPerson,format: currencyCode)
                            }
            header:{
            Text("Amount per Person")
            }
            }.navigationTitle("We split")
                .toolbar {
                    ToolbarItemGroup(placement: .keyboard) {
                        Spacer()
                        Button("Done") {
                            amountIsFocused = false
                        }
                    }
                }
            ////
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
