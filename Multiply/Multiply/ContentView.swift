//
//  ContentView.swift
//  Multiply
//
//  Created by vishwasai.karnati on 13/08/23.
//

import SwiftUI

struct ContentView: View {
    @State private var Multiplybase=1
    @State private var numofQuestions=1
    var body: some View {
        VStack {
            Stepper("MultiplyBase is \(Multiplybase) ", value: $Multiplybase, in: 2...12, step:1)
            
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
