//
//  Constants.swift
//  WeatherAppCombine
//
//  Created by Adriano Ramos on 01/03/21.
//

import Foundation

struct Constants {

    struct URLs {

        static func weather(city: String) -> String {
            "http://api.openweathermap.org/data/2.5/weather?q=\(city)&APPID=295e30a6a4522b887352a17a2b313908"
        }
    }

}
