//
//  AddressView.swift
//  CupCakes
//
//  Created by vishwasai.karnati on 27/08/23.
//

import SwiftUI

struct AddressView: View {
    @ObservedObject var ord: FinalOrder
   
    var body: some View {
        
            Form {
                Section {
                    TextField("Name", text: $ord.order.name)
                    TextField("Street Address", text: $ord.order.streetAddress)
                    TextField("City", text: $ord.order.city)
                    TextField("Zip", text: $ord.order.zip)
                }
                
                Section {
                    NavigationLink {
                        CheckOutVIew(ord: ord)
                    } label: {
                        Text("Check out")
                    }.disabled(ord.order.hasValidAddress == false)
                }
            }
            
            .navigationTitle("Delivery details")
            .navigationBarTitleDisplayMode(.inline)
            
      
    }
}

struct AddressView_Previews: PreviewProvider {
    static var previews: some View {
        AddressView(ord:FinalOrder())
    }
}
