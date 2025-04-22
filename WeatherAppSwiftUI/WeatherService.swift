//
//  WeatherService.swift
//  WeatherAppSwiftUI
//
//  Created by can on 22.04.2025.
//

import Foundation

struct WeatherService {
    
    func fetchWeather(for city: String) async throws -> WeatherResponse {
        guard let cityEncoded = city.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {
            throw URLError(.badURL)
        }

        let apiKey = "c096070dcec6744728e0dd70c15ede17"
        let urlString = "https://api.openweathermap.org/data/2.5/weather?q=\(cityEncoded)&appid=\(apiKey)&units=metric"
        
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let decodedData = try JSONDecoder().decode(WeatherResponse.self, from: data)
        return decodedData
    }
    
}
