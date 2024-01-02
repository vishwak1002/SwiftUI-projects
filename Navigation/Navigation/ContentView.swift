//
//  ContentView.swift
//  Navigation
//
//  Created by Vishwasai Karnati on 02/01/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var path = [Int]()
    

      var body: some View {
          NavigationStack {
              List(0..<100) { i in
                  Text("Row \(i)")
              }
              .navigationTitle("Title goes here")
              .navigationBarTitleDisplayMode(.inline)
              .toolbarBackground(.blue)
              .toolbarColorScheme(.dark)
//              USED for Hiding the navigation bar
//              .toolbar(.hidden, for: .navigationBar)
//          NavigationStack(path: $path) {
//              DetailView(number: 0, path: $path)
//                  .navigationDestination(for: Int.self) { i in
//                      DetailView(number: i, path: $path)
//                  }
          }
      }
        
//        @State private var path = [Int]()
//
//            var body: some View {
//                NavigationStack(path: $path) {
//                    VStack {
//                        Button("Show 32") {
//                            path = [32]
//                        }
//
//                        Button("Show 64") {
//                            path.append(64)
//                        }
//                        // more code to come
//                    }
//                    .navigationDestination(for: Int.self) { selection in
//                        Text("You selected \(selection)")
//                    }
//                }
//            }
//        VStack {
//            NavigationStack{
//                List(0..<100) { i in
//                        NavigationLink("Select \(i)", value: i)
//                }.navigationDestination(for: Int.self){s in
//                    DetailView(number: s)
//                }
//                NavigationLink("Vishwa"){
//                    DetailView(number: 20)
//                    List(0..<1000) { i in
//                            NavigationLink("Tap Me") {
//                                DetailView(number: i)
//                            }
//                        }
//
    }



struct DetailView: View {
    var number: Int
    @Binding var path: [Int]
//    var body: some View {
//        Text("Detail View \(number)")
//    }
//    var number: Int

        var body: some View {
            NavigationLink("Go to Random Number", value: Int.random(in: 1...1000))
                .navigationTitle("Number: \(number)")
                .toolbar {
                    Button("Home") {
                        path.removeAll()
                    }
                }
        }
//    init(number: Int,path:[Int]) {
//        self.number = number
////        self.path=path
//        print("Creating detail view \(number)")
//    }
}

#Preview {
    ContentView()
}
