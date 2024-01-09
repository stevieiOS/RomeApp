//
//  LocationsListView.swift
//  RomeApp
//
//  Created by Stevie on 1/8/24.
//

import SwiftUI

struct LocationsListView: View {
    
    @EnvironmentObject var vm: LocationsViewModel
    
    var body: some View {
        List {
            ForEach(vm.locations) { location in
                Button {
                    vm.showNextLocation(location: location)
                } label: {
                    listRowView(location: location)
                        .listRowBackground(Color.clear)
                        .scenePadding()
                }
            }
        }
        .listStyle(PlainListStyle())
    }
}


#Preview {
    LocationsListView()
        .environmentObject(LocationsViewModel())
}


extension LocationsListView {
    
    private func listRowView(location: Location) -> some View {
        HStack {
            if let imageName = location.imageNames.first {
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 45, height: 45)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            
            VStack(alignment: .leading) {
                Text(location.name)
                    .font(.headline)
                    .fontDesign(.rounded)
                Text(location.cityName)
                    .font(.subheadline)
                    .fontDesign(.rounded)
            }
        }
    }
}
