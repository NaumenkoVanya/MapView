//
//  Landmark.swift
//  MapView
//
//  Created by Ваня Науменко on 12.04.23.
//

import Foundation
import MapKit

struct Landmark {
    let placemark: MKPlacemark
    
    var id: UUID {
        return UUID()
    }
    var name: String {
        self.placemark.name ?? ""
    }
    var titlle: String {
        self.placemark.title ?? ""
    }
    var coordinate: CLLocationCoordinate2D {
        self.placemark.coordinate
    }
}
