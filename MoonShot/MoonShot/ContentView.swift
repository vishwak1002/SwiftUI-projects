//
//  ContentView.swift
//  MoonShot
//
//  Created by vishwasai.karnati on 06/08/23.
//

import SwiftUI

struct ContentView: View {
    let astronauts:[String:Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    @State private var showList=false
    
    
    func showGrid()->some View{
        LazyVGrid(columns: columns) {
            ForEach(missions) { mission in
                NavigationLink {
                    MissionView(mission: mission, astronauts: astronauts)
                } label: {
                    VStack {
                        Image(mission.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)

                        VStack {
                            Text(mission.displayName)
                                .font(.headline)
                                .foregroundColor(.white)
                            Text(mission.formattedLaunchDate ?? "N/A")
                                .font(.caption)
                                .foregroundColor(.white.opacity(0.5))
                        }
                        .frame(maxWidth: .infinity)
                        .background(.lightBackground)
                    }
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.lightBackground)
                    )
                   
                }
            }
        } .padding()
            .padding([.horizontal, .bottom])
        
    }
    
    func ListGrid()->some View{
        List {
            ForEach(missions) { mission in
                NavigationLink {
                    MissionView(mission: mission, astronauts: astronauts)
                } label: {
                    HStack {
                        Image(mission.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)

                        VStack {
                            Text(mission.displayName)
                                .font(.headline)
                                .foregroundColor(.white)
                            Text(mission.formattedLaunchDate ?? "N/A")
                                .font(.caption)
                                .foregroundColor(.white.opacity(0.5))
                        }
                        .frame(maxWidth: .infinity)
//                        .background(.lightBackground)
                    }
//                    .clipShape(RoundedRectangle(cornerRadius: 10))
//                    .overlay(
//                        RoundedRectangle(cornerRadius: 10)
//                            .stroke(.lightBackground)
//                    )
                   
                }
            }
        }.listStyle(.plain)
    }
   
    
    var body: some View {
        //        NavigationView {
        //        VStack {
        //            GeometryReader{
        //                geo in
        //                Image("vish")
        //                    .resizable()
        ////                    .scaledToFill()
        //                    .scaledToFit()
        //                    .frame(width: geo.size.width*0.8)
        //                    .frame(width: geo.size.width, height: geo.size.height)
        //    //                .clipped()
        //            }
        //            ScrollView(.horizontal) {
        //                LazyHStack(spacing: 10) {
        //                    ForEach(0..<100) {
        //                        Text("Item \($0)")
        //                            .font(.title)
        //                    }
        //                }.frame(width: .infinity)
        //            }
        //
        //                NavigationLink {
        //                    Text("Detail View")
        //                } label: {
        //                    Text("Hello, world!")
        //                        .padding()
        //                }
        //
        //            }
        //        .navigationTitle("SwiftUI")
        //
        //        }
        //        .padding()
        //    }
        //        NavigationView {
        //            List(0..<100) { row in
        //                NavigationLink {
        //                    Text("Detail \(row)")
        //                } label: {
        //                    Text("Row \(row)")
        //                }
        //            }
        //            .navigationTitle("SwiftUI")
        //        }
        //        VStack{
        //            Text("\(astronauts.count)")
        //        }
        NavigationView {
            
            Group{
                
                if showList{
                    ListGrid()
                        
                }
                else{
                    ScrollView {
                        showGrid()
                    }
                }
                
            }.toolbar{
                Button{
                    showList.toggle()
                }
            label:{
                Text("Toggle")
            }
            }
            .background(.darkBackground)
            .preferredColorScheme(.dark)
            .navigationTitle("Moonshot")
//                LazyVGrid(columns: columns) {
//                    ForEach(missions) { mission in
//                        NavigationLink {
//                            MissionView(mission: mission, astronauts: astronauts)
//                        } label: {
//                            VStack {
//                                Image(mission.image)
//                                    .resizable()
//                                    .scaledToFit()
//                                    .frame(width: 100, height: 100)
//
//                                VStack {
//                                    Text(mission.displayName)
//                                        .font(.headline)
//                                        .foregroundColor(.white)
//                                    Text(mission.formattedLaunchDate ?? "N/A")
//                                        .font(.caption)
//                                        .foregroundColor(.white.opacity(0.5))
//                                }
//                                .frame(maxWidth: .infinity)
//                                .background(.lightBackground)
//                            }
//                            .clipShape(RoundedRectangle(cornerRadius: 10))
//                            .overlay(
//                                RoundedRectangle(cornerRadius: 10)
//                                    .stroke(.lightBackground)
//                            )
//
//                        }
//                    }
//                } .padding()
//                    .padding([.horizontal, .bottom])
                  
            }
        }
    }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
