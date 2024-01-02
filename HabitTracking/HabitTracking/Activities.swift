//
//  Activities.swift
//  HabitTracking
//
//  Created by vishwasai.karnati on 27/08/23.
//

import Foundation

struct Activity:Identifiable,Codable,Equatable {
    var id = UUID()
    let name: String
    var  activityCount:Int
}

class Activities: ObservableObject {
    @Published var items = [Activity](){
        didSet {
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Activities")
            }
        }
    }
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Activities") {
            if let decodedItems = try? JSONDecoder().decode([Activity].self, from: savedItems) {
                items = decodedItems
                return
            }
        }

        items = []
    }
}
