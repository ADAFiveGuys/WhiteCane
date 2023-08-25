//
//  LocationManager.swift
//  WhiteCane
//
//  Created by Junyoo on 2023/08/26.
//

import MapKit
import CoreLocation
import AVFoundation

final class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate, MKMapViewDelegate {
	var locationManager: CLLocationManager?
	var currentHeading = 0.0
	var currentBearing = 0.0

	let directionRequest = MKDirections.Request()

	//APPLE
//	let source = MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 37.33181512, longitude: -122.03048154))
//	let destination = MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 37.33020389, longitude: -122.02635116))
	//ULSAN
	let source = MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 35.555641772779026, longitude: 129.13138920400553))
	let destination = MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 35.562779643817, longitude: 129.12953811110478))

	var currentLocation = CLLocationCoordinate2D(latitude: 0.0, longitude: 0.0)
	var currentDestination = CLLocationCoordinate2D(latitude: 0.0, longitude: 0.0)
	
	@Published var mapView: MKMapView = MKMapView()
	@Published var region = MKCoordinateRegion()
	@Published var navigator = ""
	@Published var coordinator = ""
	@Published var bearing: Double = 0.0
	@Published var correctDirection = false
	
	override init() {
		super.init()
		setupLocationManager()
		updateRegion()
	}
	
	func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
		guard let location = locations.last else { return }
		
		currentLocation = location.coordinate

		directionRequest.source = MKMapItem(placemark: MKPlacemark(coordinate: location.coordinate))
		directionRequest.destination = MKMapItem(placemark: destination)
		directionRequest.transportType = .walking
		
		let directions = MKDirections(request: directionRequest)
		directions.calculate { (response, error) in
			guard let directionResonse = response else {
				if let error = error {
					print("\(error.localizedDescription)")
				}
				return
			}
			
			let route = directionResonse.routes[0]
			
//			for step in route.steps {
//				print("distance: \(step.distance)m \(step.instructions)")
//				print("lat = \(step.polyline.coordinate.latitude) lng = \(step.polyline.coordinate.longitude)")
//			}
			
			if route.steps.count > 1 {
				let secondStep = route.steps[1]
				let distance = Int(secondStep.distance)
				self.navigator = String("\(distance)m \(secondStep.instructions)")
				self.coordinator = String("lat = \(secondStep.polyline.coordinate.latitude) lng = \(secondStep.polyline.coordinate.longitude)")
				self.currentDestination = secondStep.polyline.coordinate
			}

			let rect = route.polyline.boundingMapRect
			var rectRegion = MKCoordinateRegion(rect)
			rectRegion.span.latitudeDelta = rectRegion.span.latitudeDelta * 1.2
			rectRegion.span.longitudeDelta = rectRegion.span.longitudeDelta * 1.2
			self.mapView.setRegion(rectRegion, animated: true)
			self.mapView.addOverlay(route.polyline, level: .aboveRoads)
		}
		
		let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude,
											longitude: location.coordinate.longitude)
		let span = MKCoordinateSpan(latitudeDelta: 0.003, longitudeDelta: 0.003)
		region = MKCoordinateRegion(center: center, span: span)
	}
	
	func locationManager(_ manager: CLLocationManager, didUpdateHeading newHeading: CLHeading) {
		currentHeading = newHeading.trueHeading
		currentBearing = self.bearingToLocation(destination: self.currentDestination, from: currentLocation)
		
		let rawDifference = (currentBearing - currentHeading + 360).truncatingRemainder(dividingBy: 360)
		let difference: Double
		if rawDifference <= 180 {
			difference = rawDifference
		} else {
			difference = 360 - rawDifference
		}
		
		self.bearing = difference
		print(bearing)
		
		if difference <= 5 {
			vibrateDevice()
			correctDirection = true
		} else { correctDirection = false }
	}
	
	func bearingToLocation(destination: CLLocationCoordinate2D, from source: CLLocationCoordinate2D) -> Double {
		let lat1 = source.latitude.degreesToRadians
		let lon1 = source.longitude.degreesToRadians

		let lat2 = destination.latitude.degreesToRadians
		let lon2 = destination.longitude.degreesToRadians

		let dLon = lon2 - lon1

		let y = sin(dLon) * cos(lat2)
		let x = cos(lat1) * sin(lat2) - sin(lat1) * cos(lat2) * cos(dLon)

		let radiansBearing = atan2(y, x)
		if radiansBearing >= 0 {
			return radiansBearing.radiansToDegrees
		} else {
			return 360 + radiansBearing.radiansToDegrees
		}
	}

	func vibrateDevice() {
		AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
	}
	
	func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
		let renderer = MKPolylineRenderer(overlay: overlay)
		renderer.strokeColor = UIColor.blue
		renderer.lineWidth = 5.0
		return renderer
	}
	
	func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
		checkLocationAuthorization()
	}
	
	func startUpdating() {
		locationManager?.startUpdatingLocation()
		locationManager?.startUpdatingHeading()
	}
	
	private func setupLocationManager() {
		self.locationManager = CLLocationManager()
		self.locationManager!.delegate = self
		self.locationManager!.distanceFilter = 10.0
		self.locationManager!.requestWhenInUseAuthorization()
		startUpdating()

		self.mapView.delegate = self
		self.mapView.showsCompass = false
		self.mapView.addAnnotation(source)
		self.mapView.addAnnotation(destination)
	}
	
	private func updateRegion() {
		guard let location = locationManager?.location else { return }
		let span = mapView.region.span
		region = MKCoordinateRegion(center: location.coordinate,
									span: span)
	}
	
	private func checkLocationAuthorization() {
		guard let locationManager = locationManager else { return }
		
		switch locationManager.authorizationStatus {
		case .notDetermined:
			break
		case .restricted:
			print("location restricted.")
		case .denied:
			print("location denied.")
		case .authorizedAlways, .authorizedWhenInUse:
			updateRegion()
		@unknown default:
			break
		}
	}
}

extension Double {
	var degreesToRadians: Double { return self * .pi / 180 }
	var radiansToDegrees: Double { return self * 180 / .pi }
}
