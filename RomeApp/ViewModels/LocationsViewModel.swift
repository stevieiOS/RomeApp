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
    
    
    //All loaded locations
    @Published var locations: [Location]
    
    //Current location on map
    @Published var mapLocation: Location {
        didSet {
            updateMapRegion(location: mapLocation)
        }
    }
    
    //Current Region
    @Published var mapRegion: MKCoordinateRegion = MKCoordinateRegion()
    
    // Span
    let mapSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    
    init () {
        let locations = LocationsDataService.locations
        self.locations = locations
        self.mapLocation = locations.first! // will not fail because there is always atleast one item in the array -
        self.updateMapRegion(location: locations.first!)
    }
    
    private func updateMapRegion(location: Location) {
        withAnimation() {
            mapRegion = MKCoordinateRegion(
                center: location.coordinates,
                span: mapSpan)
        }
    }
}
