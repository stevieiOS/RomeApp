//
//  LocationsViewModel.swift
//  MapApp
//
//  Created by Stevie on 1/7/24.
//

import Foundation
import MapKit
import SwiftUI

class LocationsViewModel: ObservableObject {
    
    // All loaded locations
    @Published var locations: [Location]
    
    // Current location on map
    @Published var mapLocation: Location {
        didSet {
            updateMapRegion(location: mapLocation)
        }
    }
    
    // Current Region
    @Published var mapRegion: MKCoordinateRegion = MKCoordinateRegion()
    
    // Span
    let mapSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    
    // Show List of Locations
    @Published var showLocationsList: Bool = false
    
    init() {
        let locations = LocationsDataService.locations
        self.locations = locations
        self.mapLocation = locations.first! // will not fail because there is always at least one item in the array -
        self.updateMapRegion(location: locations.first!)
    }
    
    private func updateMapRegion(location: Location) {
        withAnimation() {
            mapRegion = MKCoordinateRegion(
                center: location.coordinates,
                span: mapSpan)
        }
    }
    
    // location toggle
    
    func toggleLocationsList() {
        withAnimation(.easeIn) {
            showLocationsList.toggle()
        }
    }
    
    // showNextLocation
    
    func showNextLocation(location: Location) {
        withAnimation(.easeInOut) {
            mapLocation = location
            showLocationsList = false
        }
    }
    
    func nextButtonPressed() {
        // Get current index
        guard let currentIndex = locations.firstIndex(where: {$0 == mapLocation})
        else {
            print("Could not find current index, this should never happen!")
            return
        }
        
        // check if next index is valid
        
        let nextIndex = currentIndex + 1
        guard locations.indices.contains(nextIndex) else {
            guard let firstLocation = locations.first else {return}
            showNextLocation(location: firstLocation)
            return
        }
        
        // next index IS valid
        
        let nextLocation = locations[nextIndex]
        showNextLocation(location: nextLocation)
        
    }
}
