//
//  AstronautView.swift
//  Moonshot
//
//  Created by David Bailey on 07/06/2021.
//

import SwiftUI

struct AstronautView: View {
    let astronaut: Astronaut

    var body: some View {
        ScrollView(.vertical) {
            VStack {
                Image(astronaut.id)
                    .resizable()
                    .scaledToFit()
                    .frame(width: .infinity)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .padding(.bottom)

                ForEach(
                    astronaut.description.components(separatedBy: .newlines),
                    id: \.self
                ) {
                    Text($0)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
            .padding()
        }
        .navigationTitle(astronaut.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct AstronautView_Previews: PreviewProvider {
    static let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")

    static var previews: some View {
        NavigationView {
            AstronautView(astronaut: astronauts[0])
        }
    }
}
