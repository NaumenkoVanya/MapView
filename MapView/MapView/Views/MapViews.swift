//
//  MapViews.swift
//  MapView
//
//  Created by Ваня Науменко on 12.04.23.
//

import Foundation
import MapKit
import SwiftUI

// MARK: - Coordinator

class Coordinator: NSObject, MKMapViewDelegate {
    var control: MapView

    init(control: MapView) {
        self.control = control
    }

    func mapView(_ mapView: MKMapView, didAdd views: [MKAnnotationView]) {
        if let annotationView = views.first {
            if let annotation = annotationView.annotation {
                if annotation is MKUserLocation {
                    let region = MKCoordinateRegion(center: annotation.coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
                    mapView.setRegion(region, animated: true)
                }
            }
        }
    }
}

// MARK: - MapView

struct MapView: UIViewRepresentable {
    let landmarks: [Landmark]

    func makeUIView(context: Context) -> MKMapView {
        let map = MKMapView()
        map.showsUserLocation = true
        map.delegate = context.coordinator
        return map
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(control: self)
    }

    func updateUIView(_ uiView: MKMapView, context: UIViewRepresentableContext<MapView>) {
        //
        updateAnnotations(from: uiView)
    }

    private func updateAnnotations(from mapView: MKMapView) {
        mapView.removeAnnotations(mapView.annotations)
        let annotations = self.landmarks.map(LandmarkAnnotation.init)
        mapView.addAnnotations(annotations)
    }
}
