//
//  Weather.swift
//  WeatherAppCombine
//
//  Created by Adriano Ramos on 01/03/21.
//

import Foundation

struct WeatherResponse: Decodable {
    let main: Weather
}

struct Weather: Decodable {

    let temp: Double
    let humidity: Double

//    static var placeholder: Weather {
//        return Weather(temp: nil, humidity: nil)
//    }

    static var placeholder: Weather? { nil }
}
