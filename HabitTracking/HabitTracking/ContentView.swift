//
//  ContentView.swift
//  HabitTracking
//
//  Created by vishwasai.karnati on 27/08/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var activities=Activities()
    @State var showingAddActivityForm=false
    var body: some View {
        NavigationView{
            List{
                ForEach(activities.items,id:\.id){item in
                    NavigationLink{
                        ShowActivity(activities: activities,activity: item)
                    }label: {
                        Text(item.name)
                    }
                }
                .onDelete(perform: removeExpense)
            }.sheet(isPresented: $showingAddActivityForm){
                AddActivityForm(activities: activities)
            }
            .toolbar{
                Button{
                    showingAddActivityForm=true
                }label: {
                    Text("Add")
                }
            }
            .navigationTitle("Activities")
        }
    }
    func removeExpense(at offsets:IndexSet){
        activities.items.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
