//
//  AstronautScrollView.swift
//  MoonShot
//
//  Created by vishwasai.karnati on 14/08/23.
//

import SwiftUI

struct AstronautScrollView:View{
    let crew: [CrewMember]
    var body:some View{
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(crew, id: \.role) { crewMember in
                    NavigationLink {
                        AstronautView(astronaut: crewMember.astronaut)
                    } label: {
                        HStack {
                            Image(crewMember.astronaut.id)
                                .resizable()
                                .frame(width: 104, height: 72)
                                .clipShape(RoundedRectangle(cornerRadius: 20))
//                                                .clipShape(Capsule())
//                                                .overlay(
//                                                    Capsule()
//                                                        .strokeBorder(.white, lineWidth: 1)
//                                                )

                            VStack(alignment: .leading) {
                                Text(crewMember.astronaut.name)
                                    .foregroundColor(.white)
                                    .font(.headline)
                                Text(crewMember.role)
                                    .foregroundColor(.secondary)
                            }
                        }
                        .padding(.horizontal)
                    }
                }
            }
        }

    }
}

struct AstronautScrollView_Previews: PreviewProvider {
    static let missions: [Mission] = Bundle.main.decode("missions.json")
    static let mission=missions[0]
    static let astronauts: [String : Astronaut] = Bundle.main.decode("astronauts.json")
  
    static let crew = mission.crew.map { member in
        if let astronaut = astronauts[member.name] {
            return CrewMember(role: member.role, astronaut: astronaut)
        } else {
            fatalError("Missing \(member.name)")
        }
    }
    static var previews: some View {
        AstronautScrollView(crew: crew)
    }
}
