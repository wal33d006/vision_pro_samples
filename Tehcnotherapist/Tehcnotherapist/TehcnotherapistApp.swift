//
//  TehcnotherapistApp.swift
//  Tehcnotherapist
//
//  Created by Waleed Arshad on 25/06/2023.
//

import SwiftUI

@main
struct TehcnotherapistApp: App {
    
    @State private var orbitImmersionStyle: ImmersionStyle = .mixed
    
    var body: some Scene {
        WindowGroup(id: "Content") {
            ContentView()
        }
          
        ImmersiveSpace(id: "orbits") {
            Planets()
        }
    }
}
