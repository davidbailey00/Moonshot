//
//  ContentView.swift
//  Moonshot
//
//  Created by David Bailey on 05/06/2021.
//

import SwiftUI

struct ContentView: View {
    static let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
    static let missions: [Mission] = Bundle.main.decode("missions.json")

    @State private var showingCrew = false

    var body: some View {
        NavigationView {
            List(Self.missions) { mission in
                NavigationLink(
                    destination: MissionView(
                        mission: mission,
                        missions: Self.missions,
                        astronauts: Self.astronauts
                    )
                ) {
                    Image(mission.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 44, height: 44)

                    VStack(alignment: .leading) {
                        Text(mission.displayName)
                            .font(.headline)

                        if showingCrew {
                            ForEach(
                                mission.getCrewNames(with: Self.astronauts),
                                id: \.self
                            ) {
                                Text($0)
                                    .font(.caption)
                            }
                        } else {
                            Text(mission.formattedLaunchDate)
                        }
                    }
                }
            }
            .navigationTitle("Moonshot")
            .toolbar {
                ToolbarItem {
                    Button(action: { showingCrew.toggle() }) {
                        Image(systemName: showingCrew ? "clock" : "person.2")
                        Text(showingCrew ? "Show launch" : "Show crew")
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
