//
//  CheckOutVIew.swift
//  CupCakes
//
//  Created by vishwasai.karnati on 27/08/23.
//

import SwiftUI

struct CheckOutVIew: View {
    @ObservedObject var ord: FinalOrder
    @State private var message = ""
    @State private var showingAlert = false
    @State private var alertHeading = ""
    var body: some View {
      
            ScrollView {
                VStack {
                    AsyncImage(url: URL(string: "https://hws.dev/img/cupcakes@3x.jpg"), scale: 3) { image in
                            image
                                .resizable()
                                .scaledToFit()
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(height: 233)

                    Text("Your total is \(ord.order.cost, format: .currency(code: "USD"))")
                        .font(.title)

                    Button("Place Order"){
                        Task{
                            await placeOrder()
                        }
                        }
                        
                        .padding()
                }
            }
           
            .navigationTitle("Check out")
            .alert(alertHeading, isPresented: $showingAlert) {
                Button("OK") { }
            } message: {
                Text(message)
            }
            .navigationBarTitleDisplayMode(.inline)
      
    }
    
    func placeOrder() async {
        guard let encoded = try? JSONEncoder().encode(ord.order) else {
            print("Failed to encode order")
            return
        }
        let url = URL(string: "https://reqres.in/api/cupcakes")!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        do {
            let (data, _) = try await URLSession.shared.upload(for: request, from: encoded)
            let decodedOrder = try JSONDecoder().decode(Order.self, from: data)
            alertHeading="Thank You!"
            message = "Your order for \(decodedOrder.quantity)x \(Order.types[decodedOrder.type].lowercased()) cupcakes is on its way!"
            showingAlert = true
            // handle the result
        } catch {
            alertHeading="Sorry"
            message="CHeckout failed due to \(error.localizedDescription)"
            showingAlert = true
        }
    }
}

struct CheckOutVIew_Previews: PreviewProvider {
    static var previews: some View {
        CheckOutVIew(ord: FinalOrder())
    }
}
