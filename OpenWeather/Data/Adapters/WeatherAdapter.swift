//
//  OpenWeather template generated by OpenBytes on 15/03/2023.
//
// Created by Ahmed Shendy.
//  WeatherAdapter.swift
//

import Foundation
import WeatherKit

enum WeatherAdapter: Adaptable {
    static func device(from: Weather) throws -> DeviceWeather {
        let currentWeather = from.currentWeather
        let wind = from.currentWeather.wind
        let hourlyForecast = from.hourlyForecast

        return DeviceWeather(
            currentTemperature: currentWeather.temperature,
            realFeel: currentWeather.apparentTemperature,
            symbolName: currentWeather.symbolName,
            wind: DeviceWind(
                direction: wind.direction,
                speed: wind.speed,
                gust: wind.gust
            ),
            hourlyForecast: hourlyForecast.map {
                DeviceHourlyForecast(
                    date: $0.date,
                    temperature: $0.temperature,
                    symbolName: $0.symbolName
                )
            }
        )
    }
}
