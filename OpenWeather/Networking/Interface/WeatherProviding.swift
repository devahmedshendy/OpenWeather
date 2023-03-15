//
//  OpenWeather template generated by OpenBytes on 15/03/2023.
//
// Created by Ahmed Shendy.
//  WeatherNetworking.swift
//

import Foundation
import CoreLocation

protocol WeatherProviding {
    func currentWeather(for location: CLLocation) async throws -> DeviceWeather
}
