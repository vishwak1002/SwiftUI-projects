//
//  ContentView.swift
//  IExpense
//
//  Created by vishwasai.karnati on 05/08/23.
//

import SwiftUI
import Observation


struct ExpenseItem:Identifiable,Codable,Equatable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}
@Observable
class Expenses {
    var items = [ExpenseItem](){
        didSet {
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Items") {
            if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems) {
                items = decodedItems
                return
            }
        }

        items = []
    }
}
//class User:ObservableObject{
//   @Published var firstName = "Vishwa"
//    @Published var lastName = "karnati"
//
//}
struct ContentView: View {
    //    @StateObject  var user = User()
    //    @State private var showingSheet = false
    @State private var expenses=Expenses()
    
    private var personal:[ExpenseItem]{
        expenses.items.filter({$0.type == "Personal"})
    }
    
    private var business:[ExpenseItem]{
        expenses.items.filter({$0.type == "Business"})
    }
    
    @State private var showingAddExpense = false
    
    func expenseitem(item:ExpenseItem)->some View{
        HStack{
            VStack(alignment: .leading) {
                Text(item.name)
                    .font(.headline)
                Text(item.type)
            }

            Spacer()
            Text(item.amount, format: .currency(code: Locale.current.currency?.identifier ?? "INR")
                 )
        }
    }
    var body: some View {
        NavigationStack {
            List {
                
                Section{
                    ForEach(business,id: \.id) { item in
                        expenseitem(item: item).foregroundColor(item.amount > 10 ?(item.amount > 100 ? .red : .blue)  : .green)
                    }
                    .onDelete(perform: businessRemove)
                }
                Section{
                    ForEach(personal,id: \.id) { item in
                        expenseitem(item: item).foregroundColor(item.amount > 10 ?(item.amount > 100 ? .red : .blue)  : .green)
                    }.onDelete(perform: personalRemove)
                }
                
//                ForEach(expenses.items, id: \.id) { item in
////                    Text(item.name)
////                    { item in
//
//                    expenseitem(item: item).foregroundColor(item.amount > 10 ?(item.amount > 100 ? .red : .blue)  : .green)
//
//
//
//                }.onDelete(perform: removeItems)
            }
            .sheet(isPresented: $showingAddExpense){
                AddView(expenses: expenses)
            }
            .toolbar {
                Button {
                    showingAddExpense.toggle()
//                    let expense = ExpenseItem(name: "Test", type: "Personal", amount: 5)
//                    expenses.items.append(expense)
                }
            label: {
                    Image(systemName: "plus")
                }
               
                
            
            }
            .navigationTitle("iExpense")
        }}
    
    func personalRemove(at offsets: IndexSet) {
        var indexset=IndexSet()
        for index in offsets{
            let item = personal[index]
            if let removeitem = expenses.items.firstIndex(of: item){
                indexset.insert(removeitem)
            }
        }
        expenses.items.remove(atOffsets: indexset)
        
//        personal.remove(atOffsets: offsets)
    }
     
    func businessRemove(at offsets:IndexSet){
        var indexset=IndexSet()
        for index in offsets{
            let item = business[index]
            if let removeitem = expenses.items.firstIndex(of: item){
                indexset.insert(removeitem)
            }
        }
        expenses.items.remove(atOffsets: indexset)
    }
        
//        Text("hello world")
        //        VStack(spacing:20) {
        //                   Text("Your name is \(user.firstName) \(user.lastName).")
        //
        //                   TextField("First name", text: $user.firstName)
        //                   TextField("Last name", text: $user.lastName)
        //            Button("Show Other screen") {
        //                        showingSheet.toggle()
        //                    }
        //                    .sheet(isPresented: $showingSheet) {
        //                        SecondView(name: "@twostraws",user:user)
        //                    }
        //        }.padding()
        //    }
    
    //On delete
    
    //struct ContentView: View {
    //    @State private var numbers = [Int]()
    //    @State private var currentNumber = 1
    //
    //    var body: some View {
    //        NavigationView{
    //            VStack {
    //                List {
    //                    ForEach(numbers, id: \.self) {
    //                        Text("Row \($0)")
    //                    }
    //                    .onDelete(perform: removeRows)
    //                }
    //
    //                Button("Add Number") {
    //                    numbers.append(currentNumber)
    //                    currentNumber += 1
    //                }
    //            }
    //            .toolbar {
    //                EditButton()
    //            }
    //        }
    //    }
    //    func removeRows(at offsets: IndexSet) {
    //        numbers.remove(atOffsets: offsets)
    //    }
    //}
    
    //struct ContentView: View {
    //    @State private var showingSheet = false
    //
    //    var body: some View {
    //        Button("Show Sheet") {
    //            showingSheet.toggle()
    //        }
    //        .sheet(isPresented: $showingSheet) {
    //            SecondView(name: "@twostraws")
    //        }
    //    }
    //}
    //struct SecondView: View {
    //    let name: String
    //    @Environment(\.dismiss) var dismiss
    //    @ObservedObject var user:User
    //    var body: some View {
    //        VStack{
    //
    //            TextField("First name", text: $user.firstName)
    //            TextField("Last name", text: $user.lastName)
    //            Button("Dismiss") {
    //                dismiss()
    //            }
    //        }
    //    }
    //    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
