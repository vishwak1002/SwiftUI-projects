//
//  AddActivityForm.swift
//  HabitTracking
//
//  Created by vishwasai.karnati on 27/08/23.
//

import SwiftUI

struct AddActivityForm: View {
    @ObservedObject var activities:Activities
    @State private var name = ""
    @State private var  activityCount=0
    @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationView {
            VStack{
                Form {
                    
                    Section{
                        TextField("Name", text: $name)
                    }header: {
                        Text("Please enter the name of the activity")
                    }
                    
                    Section{
                        Stepper("Activity count ", value: $activityCount, in: 0...120)
                        
                    }header: {
                        Text("Please enter the Activity count")
                    }
                }
                Text("Your Activity count is \(activityCount)")
                
            }
            .toolbar {
                Button("Save") {
                    let item = Activity(name: name,activityCount: activityCount)
                    activities.items.append(item)
                    dismiss()
                }
            }
            .navigationTitle("Add new Activity")
        }
    }
        
    
}

struct AddActivityForm_Previews: PreviewProvider {
    static var previews: some View {
        AddActivityForm(activities: Activities())
    }
}
