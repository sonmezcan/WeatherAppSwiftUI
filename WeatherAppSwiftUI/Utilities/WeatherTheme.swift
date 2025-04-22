//
//  Untitled.swift
//  WeatherAppSwiftUI
//
//  Created by can on 22.04.2025.
//

import SwiftUI

struct WeatherTheme {
    static func gradient(for icon: String) -> LinearGradient {
        switch icon {
        case "01d": // Clear Day
            return LinearGradient(colors: [.blue, .cyan], startPoint: .top, endPoint: .bottom)
        case "01n": // Clear Night
            return LinearGradient(colors: [.black, .gray], startPoint: .top, endPoint: .bottom)
        case "02d", "02n": // Few clouds
            return LinearGradient(colors: [.gray, .white], startPoint: .top, endPoint: .bottom)
        case "09d", "09n", "10d", "10n": // Rain
            return LinearGradient(colors: [.gray, .blue], startPoint: .top, endPoint: .bottom)
        case "11d", "11n": // Thunderstorm
            return LinearGradient(colors: [.purple, .black], startPoint: .top, endPoint: .bottom)
        case "13d", "13n": // Snow
            return LinearGradient(colors: [.white, .blue], startPoint: .top, endPoint: .bottom)
        case "50d", "50n": // Mist
            return LinearGradient(colors: [.gray.opacity(0.6), .white], startPoint: .top, endPoint: .bottom)
        default:
            return LinearGradient(colors: [.blue, .cyan], startPoint: .top, endPoint: .bottom)
        }
    }
}
