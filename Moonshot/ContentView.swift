//
//  ContentView.swift
//  Moonshot
//
//  Created by David Bailey on 05/06/2021.
//

import SwiftUI

struct CustomText: View {
    var text: String

    var body: some View {
        Text(text)
    }

    init(_ text: String) {
        print("Creating new custom text")
        self.text = text
    }
}

struct ContentView: View {
    var body: some View {
        ScrollView(.vertical) {
            VStack {
                ForEach(0 ..< 100) {
                    CustomText("Item \($0)").font(.title)
                }
            }
            .frame(maxWidth: .infinity)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
