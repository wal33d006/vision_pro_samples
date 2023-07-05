//
//  Planets.swift
//  Tehcnotherapist
//
//  Created by Waleed Arshad on 29/06/2023.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct Planets: View {
    @Environment(\.dismissWindow) private var dismissWindow
    
    var body: some View {
        
        RealityView { content in
            if let scene = try? await Entity(named: "Zero", in: realityKitContentBundle) {
                content.add(scene)
            }
        }
        .gesture(TapGesture().targetedToAnyEntity().onEnded { value in
            let timer = Timer.scheduledTimer(withTimeInterval: 3, repeats: true) { timer in
                
                var transform = value.entity.transform
                let radians = 90.0 * Float.pi / 180.0
                transform.rotation *= simd_quatf(angle: radians, axis: SIMD3<Float>(1,0,0))
                
                value.entity.move(
                    to: transform,
                    relativeTo: nil,
                    duration: 3,
                    timingFunction: .linear
                )
                
                
            }
            timer.fire()
        })
        .onAppear {
            dismissWindow(id: "Content")
        }
    }
    
}


#Preview {
    Planets()
}
