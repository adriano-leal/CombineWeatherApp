//
//  Service.swift
//  WeatherAppCombine
//
//  Created by Adriano Ramos on 01/03/21.
//

import Foundation
import Combine

class Service {

    func fetchWeather(city: String) -> AnyPublisher<Weather, Error> {
        guard let url = URL(string: Constants.URLs.weather(city: city)) else { fatalError("URL Inválida :(") }

        return URLSession
            .shared
            .dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: WeatherResponse.self, decoder: JSONDecoder())
            .map { $0.main }
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }

}
