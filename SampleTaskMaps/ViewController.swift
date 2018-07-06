//
//  ViewController.swift
//  SampleTaskMaps
//
//  Created by Basavaraj D on 06/07/2018.
//  Copyright © 2018 Basavaraj D. All rights reserved.
//

import UIKit
import GoogleMaps

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    let camera = GMSCameraPosition.camera(withLatitude: -33.86, longitude: 151.20, zoom: 6.0)
    let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
    view = mapView
    
    // Creates a marker in the center of the map.
//    let marker = GMSMarker()
//    marker.position = CLLocationCoordinate2D(latitude: 12.9716, longitude: 77.5946)
//    marker.title = "Bangalore"
//    marker.snippet = "Bangalore"
//    marker.map = mapView
//
//    marker.icon = GMSMarker.markerImage(with: .red)
//    marker.tracksInfoWindowChanges = true

    let marker1 = GMSMarker()
    marker1.position = CLLocationCoordinate2D(latitude: 13.0827, longitude: 80.2707)
    marker1.title = "Chennai airport"
    marker1.snippet = "Chennai airport"
    marker1.map = mapView
    
    marker1.icon = GMSMarker.markerImage(with: .red)
    marker1.tracksInfoWindowChanges = true
    
    let marker2 = GMSMarker()
    marker2.position = CLLocationCoordinate2D(latitude: 19.0760, longitude: 72.8777)
    marker2.title = "Mumbai airport"
    marker2.snippet = "Mumbai airport"
    marker2.map = mapView
    
    marker2.icon = GMSMarker.markerImage(with: .blue)
    marker2.tracksInfoWindowChanges = true
    
    let path = GMSMutablePath()
    //path.add(CLLocationCoordinate2D(latitude: 12.9716, longitude: 77.5946))
    path.add(CLLocationCoordinate2D(latitude: 13.0827, longitude: 80.2707))
    path.add(CLLocationCoordinate2D(latitude: 19.0760, longitude: 72.8777))

    let polyline = GMSPolyline(path: path)
    polyline.strokeColor = .blue
    polyline.strokeWidth = 2
    polyline.geodesic = true
    polyline.map = mapView
    
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

