//
//  LocationManager.swift
//  WeatherApp
//
//  Created by Jorabek Boyxorozov on 09/12/24.
//

import CoreLocation
import Foundation



final class LocationManager: NSObject, CLLocationManagerDelegate{
    private let manager = CLLocationManager()
    static let shared = LocationManager()
    private var locationFetchComplation: ((CLLocation?) -> Void)?
    private var location: CLLocation?{
        didSet {
            guard let location = location else { return }
            locationFetchComplation?(location)
        }
        
    }
    
    public func getCurrentLocation(complation: @escaping  ((CLLocation?) -> Void) ){
        self.locationFetchComplation = complation
        manager.requestWhenInUseAuthorization()
        manager.delegate = self
        manager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        self.location = location
        manager.stopUpdatingLocation()
    }
 
}
