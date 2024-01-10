//
//  LocationsPreviewVIew.swift
//  RomeApp
//
//  Created by Stevie on 1/9/24.
//

import SwiftUI

struct LocationsPreviewView: View {
    
    @EnvironmentObject private var vm: LocationsViewModel
    let location: Location
    
    
    var body: some View {
        HStack(alignment: .bottom) {
            VStack(alignment: .leading, spacing: 16.0) {
                imageSection
                imageTextSection
            }
            
            VStack(spacing: 8) {
                learnMoreButton
                nextButton
            }
        }
        .padding(20)
        .background(RoundedRectangle(cornerRadius: 10)
            .fill(.ultraThinMaterial)
            .offset(y: 65)
        )
        .cornerRadius(10)
        .clipped()
    }
}

#Preview {
    ZStack {
        Color.green.ignoresSafeArea()
        LocationsPreviewView(location: LocationsDataService.locations.first!)
            .scenePadding()
            .environmentObject(LocationsViewModel())
    }
}


extension LocationsPreviewView {
    private var imageSection: some View {
        ZStack {
            if let imageName = location.imageNames.first {
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                    .cornerRadius(10)
            }
        }
        .padding(6)
        .background(Color.white)
        .cornerRadius(10)
    }
}

extension LocationsPreviewView {
    private var imageTextSection: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(location.name)
                .font(.headline)
                .fontWeight(.bold)
                .fontDesign(.rounded)
            Text(location.cityName)
                .font(.subheadline)
                .fontDesign(.rounded)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var learnMoreButton: some View {
        Button(action: {
            
        }, label: {
            Text("Learn More")
                .font(.headline)
                .fontDesign(.rounded)
                .frame(width: 125, height: 35)
                .foregroundColor(.white)
        })
        .buttonStyle(.borderedProminent)
        .tint(Color.blue)
    }
    
    
    private var nextButton: some View {
        Button {
            vm.nextButtonPressed()
        } label: {
            Text("Next")
                .font(.headline)
                .fontDesign(.rounded)
                .frame(width: 125, height: 35)
                .foregroundColor(.blue)
                .shadow(color: .blue.opacity(0.4), radius: 20, x: 0, y: 15)
        }
        .buttonStyle(.bordered)
    }
}
