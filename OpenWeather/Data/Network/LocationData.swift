//
//  OpenWeather template generated by OpenBytes on 22/03/2023.
//
// Created by Ahmed Shendy.
//  LocationData.swift
//

import GRDB
import Foundation
import CoreLocation

struct LocationData: Codable {
    let name: String
    let lat: Double
    let long: Double

    var location: CLLocation { .init(latitude: lat, longitude: long) }

    init(name: String, lat: Double, long: Double) {
        self.name = name
        self.lat = lat
        self.long = long
    }

    init(name: String, location: CLLocation) {
        self.name = name
        self.lat = location.coordinate.latitude
        self.long = location.coordinate.longitude
    }
}

extension LocationData: TableRecord, FetchableRecord {
    static var databaseTableName: String = "favorites"
}

extension LocationData: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
        hasher.combine(lat)
        hasher.combine(long)
    }

    static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.name == rhs.name
        && lhs.lat == rhs.lat
        && lhs.long == rhs.long
    }
}

extension LocationData: CustomStringConvertible {
    var description: String {
        """
        {
            name: \(name),
            latitude: \(lat),
            longitude: \(long)
        }
        """
    }
}
