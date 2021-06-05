//
//  ContentView.swift
//  Moonshot
//
//  Created by David Bailey on 05/06/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image("staircase")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: .infinity)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
