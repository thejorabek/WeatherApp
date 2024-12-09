//
//  CurrentWeatherView.swift
//  WeatherApp
//
//  Created by Jorabek Boyxorozov on 09/12/24.
//

import UIKit

final class CurrentWeatherView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .orange
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }

}
