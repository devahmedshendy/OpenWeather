//
//  OpenWeather template generated by OpenBytes on 22/03/2023.
//
// Created by Ahmed Shendy.
//  DeviceLocation.swift
//

import SwiftUI
import CoreLocation

struct DeviceLocation: Identifiable {
    let id = UUID()
    let name: String
    let latitude: Double
    let longitude: Double

    var isFavorite: Bool

    var location: CLLocation { .init(latitude: latitude, longitude: longitude) }

    init(name: String, latitude: Double, longitude: Double, isFavorite: Bool = false) {
        self.name = name
        self.latitude = latitude
        self.longitude = longitude
        self.isFavorite = isFavorite
    }

    init(name: String, location: CLLocation, isFavorite: Bool = false) {
        self.name = name
        self.latitude = location.coordinate.latitude
        self.longitude = location.coordinate.longitude
        self.isFavorite = isFavorite
    }
}

extension DeviceLocation: Equatable {
    static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.name == rhs.name
        && lhs.latitude == rhs.latitude
        && lhs.longitude == rhs.longitude
    }
}

extension DeviceLocation: CustomStringConvertible {
    var description: String {
        """
        {
            id: \(id),
            name: \(name),
            latitude: \(latitude),
            longitude: \(longitude),
            isFavorite: \(isFavorite)
        }
        """
    }
}
