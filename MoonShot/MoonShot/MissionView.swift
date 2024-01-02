//
//  MissionView.swift
//  MoonShot
//
//  Created by vishwasai.karnati on 14/08/23.
//

import SwiftUI

struct CrewMember {
    let role: String
    let astronaut: Astronaut
}



struct MissionView: View {
    let crew: [CrewMember]
    let mission:Mission
    init(mission: Mission, astronauts: [String: Astronaut]) {
        self.mission = mission
        
        self.crew = mission.crew.map { member in
            if let astronaut = astronauts[member.name] {
                return CrewMember(role: member.role, astronaut: astronaut)
            } else {
                fatalError("Missing \(member.name)")
            }
        }
    }
    func divider()->some View{
        Rectangle()
            .frame(height: 2)
            .foregroundColor(.lightBackground)
            .padding(.vertical)
    }
    @available(iOS 17.0, *)
    var body: some View {
        
        GeometryReader { geometry in
            ScrollView {
                VStack {
                    Image(mission.image)
                        .resizable()
                        .scaledToFit()
                        .containerRelativeFrame(.horizontal) { width, axis in
                                                width * 0.6
                                            }
//                        .frame(maxWidth: geometry.size.width * 0.6)
                        .padding(.top)
                    Text(mission.formattedLaunchDate ?? "N/A")
                        .font(.headline)
                        .padding(.bottom,2)
                    VStack(alignment: .leading) {
                        divider()
                       
                        Text("Mission Highlights")
                            .font(.title.bold())
                            .padding(.bottom, 5)
                        Text("Crew")
                            .font(.title.bold())
                            .padding(.bottom, 5)
//                        ScrollView(.horizontal, showsIndicators: false) {
//                            HStack {
//                                ForEach(crew, id: \.role) { crewMember in
//                                    NavigationLink {
//                                        AstronautView(astronaut: crewMember.astronaut)
//                                    } label: {
//                                        HStack {
//                                            Image(crewMember.astronaut.id)
//                                                .resizable()
//                                                .frame(width: 104, height: 72)
//                                                .clipShape(RoundedRectangle(cornerRadius: 20))
////                                                .clipShape(Capsule())
////                                                .overlay(
////                                                    Capsule()
////                                                        .strokeBorder(.white, lineWidth: 1)
////                                                )
//
//                                            VStack(alignment: .leading) {
//                                                Text(crewMember.astronaut.name)
//                                                    .foregroundColor(.white)
//                                                    .font(.headline)
//                                                Text(crewMember.role)
//                                                    .foregroundColor(.secondary)
//                                            }
//                                        }
//                                        .padding(.horizontal)
//                                    }
//                                }
//                            }
//                        }
                        AstronautScrollView(crew: crew)
                        
                        Text(mission.description)
                        
                        divider()
                    }
                    .padding(.horizontal)
                }
                .padding(.bottom)
            }
        }
        .navigationTitle(mission.displayName)
        .navigationBarTitleDisplayMode(.inline)
        .background(.darkBackground)
    }
}

struct MissionView_Previews: PreviewProvider {
    static let missions: [Mission] = Bundle.main.decode("missions.json")
    static let astronauts: [String : Astronaut] = Bundle.main.decode("astronauts.json")
    static var previews: some View {
        MissionView(mission: missions[0],astronauts: astronauts)
            .preferredColorScheme(.dark)
    }
}
