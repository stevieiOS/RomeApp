//
//  LocationAnnotationView.swift
//  RomeApp
//
//  Created by Stevie on 1/9/24.
//

import SwiftUI

struct LocationAnnotationView: View {
    
    var body: some View {
        VStack {
            Image(systemName: "mappin")
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
                .font(.headline)
                .foregroundColor(.red)
                .padding(6)
                .cornerRadius(36)
        }
    }
}

#Preview {
    LocationAnnotationView()
}
