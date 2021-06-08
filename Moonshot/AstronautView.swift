//
//  AstronautView.swift
//  Moonshot
//
//  Created by David Bailey on 07/06/2021.
//

import SwiftUI

struct AstronautView: View {
    struct AssociatedMission {
        let role: String
        let mission: Mission
    }

    let astronaut: Astronaut
    let associatedMissions: [AssociatedMission]

    var body: some View {
        ScrollView(.vertical) {
            VStack {
                Image(astronaut.id)
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .padding(.bottom)

                ForEach(
                    astronaut.description.components(separatedBy: .newlines),
                    id: \.self
                ) {
                    Text($0)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }

                Spacer(minLength: 16)

                ForEach(associatedMissions, id: \.role) { mission in
                    HStack {
                        Image(mission.mission.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 44, height: 44)
                            .padding(.trailing, 4)

                        VStack(alignment: .leading) {
                            Text(mission.mission.displayName)
                                .font(.headline)
                            Text(mission.role)
                        }

                        Spacer()
                    }
                }
            }
            .padding()
        }
        .navigationTitle(astronaut.name)
        .navigationBarTitleDisplayMode(.inline)
    }

    init(astronaut: Astronaut, missions: [Mission]) {
        self.astronaut = astronaut
        var associatedMissions = [AssociatedMission]()

        for mission in missions {
            if let match = mission.crew.first(
                where: { $0.name == astronaut.id }
            ) {
                associatedMissions.append(
                    AssociatedMission(role: match.role, mission: mission)
                )
            }
        }

        self.associatedMissions = associatedMissions
    }
}

struct AstronautView_Previews: PreviewProvider {
    static let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
    static let missions: [Mission] = Bundle.main.decode("missions.json")

    static var previews: some View {
        NavigationView {
            AstronautView(astronaut: astronauts[10], missions: missions)
        }
    }
}
