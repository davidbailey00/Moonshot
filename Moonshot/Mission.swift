//
//  Mission.swift
//  Moonshot
//
//  Created by David Bailey on 06/06/2021.
//

import Foundation

struct Mission: Codable, Identifiable {
    struct CrewRole: Codable {
        let name: String
        let role: String
    }

    let id: Int
    let launchDate: Date?
    let crew: [CrewRole]
    let description: String

    var displayName: String { "Apollo \(id)" }
    var image: String { "apollo\(id)" }

    var formattedLaunchDate: String {
        if let launchDate = launchDate {
            let formatter = DateFormatter()
            formatter.dateStyle = .long
            return formatter.string(from: launchDate)
        } else {
            return "Did not launch"
        }
    }

    func getCrewNames(with astronauts: [Astronaut]) -> [String] {
        return crew.map { member in
            let match = astronauts.first { $0.id == member.name }!
            return match.name
        }
    }
}
