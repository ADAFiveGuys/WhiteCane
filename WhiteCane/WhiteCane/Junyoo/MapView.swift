//
//  MapView.swift
//  WhiteCane
//
//  Created by Junyoo on 2023/08/26.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
	@ObservedObject var locationManager: LocationManager

	func makeUIView(context: Context) -> MKMapView {
		return locationManager.mapView
	}
	
	func updateUIView(_ uiView: MKMapView, context: Context) {
//		uiView.setRegion(locationManager.region, animated: true)
	}
}
