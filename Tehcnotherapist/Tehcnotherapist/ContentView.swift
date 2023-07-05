//
//  ContentView.swift
//  Tehcnotherapist
//
//  Created by Waleed Arshad on 25/06/2023.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {
    
    @Environment(\.openWindow) private var openWindow
    
    @Environment(\.openImmersiveSpace) private var openImmersiveSpace
    var body: some View {
        
        VStack {
            Button("Show Earth & Moon") {
                Task {
                    await openImmersiveSpace(id: "orbits")
                }
                
            }
        }
        
    }
}

#Preview {
    ContentView()
}
