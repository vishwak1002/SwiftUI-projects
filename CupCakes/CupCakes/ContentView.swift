//
//  ContentView.swift
//  CupCakes
//
//  Created by vishwasai.karnati on 27/08/23.
//

import SwiftUI

//enum CodingKeys: CodingKey {
//    case name
//}
//
//struct Response: Codable {
//    var results: [Result]
//}
//
//struct Result: Codable {
//    var trackId: Int
//    var trackName: String
//    var collectionName: String
//}

//struct ContentView: View {
//    @State private var results = [Result]()
//
//    var body: some View {
//        VStack{
//            List(results, id: \.trackId) { item in
//                VStack(alignment: .leading) {
//                    Text(item.trackName)
//                        .font(.headline)
//                    Text(item.collectionName)
//                    //                AsyncImage(url: URL(string: "https://hws.dev/img/logo.png"), scale: 3)
//                }
//
//            }.task {
//                await loadData()
//            }
//            AsyncImage(url: URL(string: "https://hws.dev/img/logo.png")) { image in
//                image
//                    .resizable()
//                    .scaledToFit()
//            } placeholder: {
//                Color.red
//            }
//            .frame(width: 200, height: 200)
//            AsyncImage(url: URL(string: "https://hws.dev/img/bad.png")) { phase in
//                if let image = phase.image {
//                    image
//                        .resizable()
//                        .scaledToFit()
//                } else if phase.error != nil {
//                    Text("There was an error loading the image.")
//                } else {
//                    ProgressView()
//                }
//            }
//            .frame(width: 200, height: 200)
//        }
//
//    }
//    func loadData() async {
//        guard let url = URL(string: "https://itunes.apple.com/search?term=taylor+swift&entity=song") else {
//            print("Invalid URL")
//            return
//        }
//        do {
//            let (data, _) = try await URLSession.shared.data(from: url)
//            if let decodedResponse = try? JSONDecoder().decode(Response.self, from: data) {
//                results = decodedResponse.results
//            }
//            // more code to come
//        } catch {
//            print("Invalid data")
//        }
//    }
//}
//class User: ObservableObject, Codable {
//   @Published var name = "Paul Hudson"
//    required init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        name = try container.decode(String.self, forKey: .name)
//    }
//    func encode(to encoder: Encoder) throws {
//        var container = encoder.container(keyedBy: CodingKeys.self)
//        try container.encode(name, forKey: .name)
//    }
//}


struct ContentView: View {
    @StateObject var ord = FinalOrder()
    var body: some View {
//
        NavigationView{
            Form{
                   Section {
                       Picker("Select your cake type", selection: $ord.order.type) {
                           ForEach(Order.types.indices) {
                               Text(Order.types[$0])
                           }
                       }
//                       Picker("Select your cake type", selection: $ord.order.type) {
//                                       ForEach(Order.types.indices) {
//                                           Text(Order.types[$0])
//                                       }
//                                   }

                       Stepper("Number of cakes: \(ord.order.quantity)", value: $ord.order.quantity, in: 3...20)
                   }
                Section {
                    Toggle("Any special requests?", isOn: $ord.order.specialRequestEnabled.animation())

                    if ord.order.specialRequestEnabled {
                        Toggle("Add extra frosting", isOn: $ord.order.extraFrosting)

                        Toggle("Add extra sprinkles", isOn: $ord.order.addSprinkles)
                    }
                }
                Section {
                    NavigationLink {
                        AddressView(ord: ord)
                    } label: {
                        Text("Delivery details")
                    }
                }

               }.navigationTitle("Cupcake Corner")

             }
        }
    }

        

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
