 //
//  WeatherManager.swift
//  WeatherApp
//
//  Created by Jorabek Boyxorozov on 09/12/24.
//

import CoreLocation 
import Foundation
import WeatherKit

final class WeatherManager {
    static let shared = WeatherManager()
    
    let service = WeatherService.shared
    
    private init (){}
    
    public func getWeather(for location: CLLocation, completion: @escaping () -> Void){
        Task {
            do {
                let result = try await service.weather(for: location)
                print("Current weather: \(result.currentWeather)")
                print("Hourly weather: \(result.hourlyForecast)")
                print("Daily weather: \(result.dailyForecast)")
                completion()
            } catch {
                print(error)
            }
            completion()
        }
    }
}
