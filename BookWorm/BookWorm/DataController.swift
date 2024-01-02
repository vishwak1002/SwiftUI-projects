//
//  DataController.swift
//  BookWorm
//
//  Created by vishwasai.karnati on 27/08/23.
//

import Foundation
import SwiftUI

import CoreData


class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "Bookworm")
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core Data failed to load: \(error.localizedDescription)")
            }
        }
    }
}
