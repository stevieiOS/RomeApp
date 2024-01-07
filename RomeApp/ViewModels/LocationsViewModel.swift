//
//  LocationsViewModel.swift
//  MapApp
//
//  Created by Stevie on 1/7/24.
//

import Foundation
import MapKit

class LocationsViewModel: ObservableObject {
    
    @Published var locations: [Location]
    
    init () {
        let locations = LocationsDataService.locations
        self.locations = locations
    }
    
}
