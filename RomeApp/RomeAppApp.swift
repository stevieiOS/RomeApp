//
//  RomeAppApp.swift
//  RomeApp
//
//  Created by Stevie on 1/7/24.
//

import SwiftUI

@main
struct MapAppApp: App {
    
    @State private var vm = LocationsViewModel()
    
    var body: some Scene {
        WindowGroup {
            LocationsView()
                .environmentObject(vm)
        }
    }
}
