//
//  MissionView.swift
//  Moonshot
//
//  Created by David Bailey on 07/06/2021.
//

import SwiftUI

struct MissionView: View {
    struct CrewMember {
        let role: String
        let astronaut: Astronaut
    }

    let mission: Mission
    let crew: [CrewMember]

    var body: some View {
        ScrollView(.vertical) {
            VStack {
                Image(mission.image)
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity)
                    .padding(30)

                ForEach(
                    mission.description.components(separatedBy: .newlines),
                    id: \.self
                ) {
                    Text($0)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }

                Spacer(minLength: 16)

                ForEach(crew, id: \.role) { crewMember in
                    NavigationLink(
                        destination: AstronautView(
                            astronaut: crewMember.astronaut
                        )
                    ) {
                        HStack {
                            Image(crewMember.astronaut.id)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 50, height: 40)
                                .clipShape(Capsule())
                                .padding(.trailing, 8)

                            VStack(alignment: .leading) {
                                Text(crewMember.astronaut.name)
                                    .font(.headline)
                                Text(crewMember.role)
                                    .foregroundColor(.secondary)
                            }

                            Spacer()
                        }
                    }
                }
            }
            .padding()
        }
        .navigationTitle(mission.displayName)
        .navigationBarTitleDisplayMode(.inline)
    }

    init(mission: Mission, astronauts: [Astronaut]) {
        self.mission = mission
        var crew = [CrewMember]()

        for member in mission.crew {
            let match = astronauts.first { $0.id == member.name }!
            crew.append(CrewMember(role: member.role, astronaut: match))
        }

        self.crew = crew
    }
}

struct MissionView_Previews: PreviewProvider {
    static let missions: [Mission] = Bundle.main.decode("missions.json")
    static let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")

    static var previews: some View {
        NavigationView {
            MissionView(mission: missions[0], astronauts: astronauts)
        }
    }
}
