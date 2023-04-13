//
//  ContentView.swift
//  MapView
//
//  Created by Ваня Науменко on 13.04.23.
//

import CoreLocation
import MapKit
import SwiftUI

// MARK: - ContentView

struct ContentView: View {
    @ObservedObject var locationManager = LocationManager()
    @State private var landmarks: [Landmark] = .init()
    @State private var search: String = ""
    @State private var tapped: Bool = false
    
    private func getNearByLandmarks() {
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = search
        
        let search = MKLocalSearch(request: request)
        search.start { response, _ in
            if let response = response {
                let mapItems = response.mapItems
                self.landmarks = mapItems.map {
                    Landmark(placemark: $0.placemark)
                }
            }
        }
    }
    
    func calculateOfset() -> CGFloat {
        if self.landmarks.count > 0 && !self.tapped {
            return UIScreen.main.bounds.size.height -
                UIScreen.main.bounds.size.height / 4
        } else if self.tapped {
            return 100
        } else {
            return UIScreen.main.bounds.height
        }
    }
    
    var body: some View {
        ZStack(alignment: .top) {
            MapView(landmarks: landmarks).ignoresSafeArea()
            
            TextField("Search", text: $search, onEditingChanged: { _ in }) {
                // commit
                self.getNearByLandmarks()
            }.textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .offset(y: 44)
            
            PlaceListView(landmarks: self.landmarks) {
                self.tapped.toggle()
        }.animation(.spring())
                .offset(y: calculateOfset())
        }
    }
}

// MARK: - MapUIView_Previews

struct MapUIView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
