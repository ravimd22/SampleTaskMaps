//
//  ViewController.swift
//  SampleTaskMaps
//
//  Created by Ravi on 06/07/2018.
//  Copyright © 2018 Ravi. All rights reserved.
//

import UIKit
import GoogleMaps

class ViewController: UIViewController,GMSMapViewDelegate,CLLocationManagerDelegate {
    let locationManager = CLLocationManager()
    var currentLocation :CLLocationCoordinate2D?
    var mapView : GMSMapView?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Ask for Authorisation from the User.
        self.locationManager.requestAlwaysAuthorization()
        
        // For use in foreground
        self.locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
        
        self.addAnnotationsToMapView()
        
    }
    
    func addAnnotationsToMapView()  {
        
        let camera = GMSCameraPosition.camera(withLatitude: 12.9716, longitude: 77.5946, zoom: 6.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        view = mapView
        mapView.delegate = self
        
        // Creates a marker in the center of the map.
        //    let marker = GMSMarker()
        //    marker.position = currentLocation ?? CLLocationCoordinate2D(latitude: 12.9716, longitude: 77.5946)
        //    marker.title = "Bangalore"
        //    marker.snippet = "Bangalore"
        //    marker.map = mapView
        //
        //    marker.icon = GMSMarker.markerImage(with: .green)
        //    marker.tracksInfoWindowChanges = true
        
        let marker1 = GMSMarker()
        marker1.position = CLLocationCoordinate2D(latitude: 12.9941, longitude: 80.1709)
        marker1.title = "Chennai International Airport"
        marker1.snippet = "Chennai"
        marker1.map = mapView
        
        marker1.icon = GMSMarker.markerImage(with: .blue)
        marker1.tracksInfoWindowChanges = true
        
        let marker2 = GMSMarker()
        marker2.position = CLLocationCoordinate2D(latitude: 19.0896, longitude: 72.8656)
        marker2.title = "Chhatrapati Shivaji International Airport"
        marker2.snippet = "Mumbai"
        marker2.map = mapView
        
        marker2.icon = GMSMarker.markerImage(with: .red)
        marker2.tracksInfoWindowChanges = true
        
        let path = GMSMutablePath()
        path.add(CLLocationCoordinate2D(latitude: 13.0827, longitude: 80.2707))
        //path.add(CLLocationCoordinate2D(latitude: 12.9716, longitude: 77.5946))
        
        let polyline = GMSPolyline(path: path)
        polyline.strokeColor = .orange
        polyline.strokeWidth = 2
        polyline.geodesic = true
        polyline.map = mapView
        
        let pathBangloreToChennai = GMSMutablePath()
        pathBangloreToChennai.add(CLLocationCoordinate2D(latitude: 13.0827, longitude: 80.2707))
        pathBangloreToChennai.add(CLLocationCoordinate2D(latitude: 19.0760, longitude: 72.8777))
        
        let polylineBangloreToChennai = GMSPolyline(path: pathBangloreToChennai)
        polylineBangloreToChennai.strokeColor = .blue
        polylineBangloreToChennai.strokeWidth = 2
        polylineBangloreToChennai.geodesic = true
        polylineBangloreToChennai.map = mapView
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        print("locations = \(locValue.latitude) \(locValue.longitude)")
        currentLocation = locValue
        
        let userLocation:CLLocation = locations[0] as CLLocation
        
        // Call stopUpdatingLocation() to stop listening for location updates,
        // other wise this function will be called every time when user location changes.
        //manager.stopUpdatingLocation()
        
        
        let camera = GMSCameraPosition.camera(withLatitude: (userLocation.coordinate.latitude), longitude: (userLocation.coordinate.longitude), zoom: 6.0)
        
        self.mapView?.animate(to: camera)
        // self.addAnnotationsToMapView()
        
        //Finally stop updating location otherwise it will come again and again in this delegate
        self.locationManager.stopUpdatingLocation()
        
    }
    
    func didTapMyLocationButton(for mapView: GMSMapView) -> Bool {
        return true
    }
    
    func mapView(_ mapView: GMSMapView, didTapInfoWindowOf marker: GMSMarker) {
        print(marker.title)
    }
    
    func mapView(_ mapView: GMSMapView, didTapPOIWithPlaceID placeID: String, name: String, location: CLLocationCoordinate2D) {
        print(name)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

