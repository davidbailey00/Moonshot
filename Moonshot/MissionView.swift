//
//  MissionView.swift
//  Moonshot
//
//  Created by David Bailey on 07/06/2021.
//

import SwiftUI

struct MissionView: View {
    let mission: Mission

    var body: some View {
        ScrollView(.vertical) {
            VStack {
                Image(mission.image)
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity)
                    .padding(30)

                Text(mission.description)
            }
            .padding()
        }
        .navigationTitle(mission.displayName)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct MissionView_Previews: PreviewProvider {
    static let missions: [Mission] = Bundle.main.decode("missions.json")

    static var previews: some View {
        NavigationView {
            MissionView(mission: missions[0])
        }
    }
}
