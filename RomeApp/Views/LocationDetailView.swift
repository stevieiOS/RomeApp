//
//  LocationDetailView.swift
//  RomeApp
//
//  Created by Stevie on 1/10/24.
//

import MapKit
import SwiftUI

struct LocationDetailView: View {
    @EnvironmentObject private var vm: LocationsViewModel
    let location: Location

    var body: some View {
        ScrollView {
            VStack {
                imageSection
                    .shadow(color: Color.black.opacity(0.4), radius: 20, x: 0, y: 15)
                VStack(alignment: .leading, spacing: 16) {
                    titleSection
                    Divider()
                    descriptionSection
                    Divider()
                    mapLayer
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            }
        }
        .ignoresSafeArea()
        .background(.ultraThinMaterial)
        .overlay(backButton, alignment: .topLeading)
    }
}

#Preview {
    LocationDetailView(location: LocationsDataService.locations.first!)
        .environmentObject(LocationsViewModel())
}

extension LocationDetailView {
    private var imageSection: some View {
        TabView {
            ForEach(location.imageNames, id: \.self) { imageName in
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIScreen.main.bounds.width)
                    .clipped()
            }
        }
        .frame(height: 500)
        .tabViewStyle(PageTabViewStyle())
    }

    private var titleSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(location.name)
                .font(.largeTitle)
                .fontDesign(.rounded)
                .fontWeight(.bold)
            Text(location.cityName)
                .font(.title3)
                .fontDesign(.rounded)
                .foregroundStyle(.secondary)
        }
    }

    private var descriptionSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(location.description)
                .font(.subheadline)
                .fontDesign(.rounded)
                .foregroundStyle(.secondary)

            if let url = URL(string: location.link) {
                Link("Learn More on Wiki", destination: url)
                    .font(.headline)
                    .foregroundStyle(.blue)
                    .padding()
            }
        }
    }

    private var mapLayer: some View {
        Map(coordinateRegion: .constant(MKCoordinateRegion(
            center: location.coordinates, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))),
        annotationItems: [location]) { location in
            MapAnnotation(coordinate: location.coordinates) {
                LocationAnnotationView()
                    .shadow(radius: 10)
            }
        }
        .allowsHitTesting(/*@START_MENU_TOKEN@*/false/*@END_MENU_TOKEN@*/)
        .aspectRatio(1, contentMode: .fit)
        .cornerRadius(30)
    }

    private var backButton: some View {
        Button(action: {
            vm.sheetLocation = nil
        }, label: {
            Image(systemName: "xmark")
                .font(.headline)
                .padding()
                .foregroundColor(.black)
                .background(.thickMaterial)
                .cornerRadius(10)
                .padding()
        })
    }
}
