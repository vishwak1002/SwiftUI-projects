//
//  ShowActivity.swift
//  HabitTracking
//
//  Created by vishwasai.karnati on 27/08/23.
//

import SwiftUI

struct ShowActivity: View {
    @ObservedObject var activities:Activities
//    @State  private var name = activity.name
    @State  var activity:Activity
    
//    @State  var  activityCount=activity.activityCount
    var body: some View {
        NavigationView {
            VStack{
//                Text( activity.name)
                Text("The Activity count is \(activity.activityCount)")
                Button{
                    var index=activities.items.firstIndex(of: activity)
//                    var newActivity=activity
                    activity.activityCount += 1
//                    activity=newActivity
                    activities.items[index ?? 0]=activity
                }
            label:{
                Text("Increase the activity count")
            }
                   
                }
            .navigationTitle(activity.name)
               
        }
        }
    }


struct ShowActivity_Previews: PreviewProvider {
    static var previews: some View {
        ShowActivity(activities: Activities(),activity: Activities().items[0])
    }
}
