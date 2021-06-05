//
//  ContentView.swift
//  Moonshot
//
//  Created by David Bailey on 05/06/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List(0 ..< 100) { row in
                NavigationLink(destination: Text("Detail \(row)")) {
                    Text("Row \(row)")
                }
            }
            .navigationTitle("SwiftUI")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
