//
//  WeatherViewModel.swift
//  WeatherAppSwiftUI
//
//  Created by can on 22.04.2025.
//

import Foundation

@MainActor
class WeatherViewModel: ObservableObject {
    @Published var weather: WeatherResponse?
    @Published var isLoading = false
    @Published var errorMessage: String?

    func getWeather(for city: String) {
        Task {
            isLoading = true
            errorMessage = nil
            do {
                let result = try await WeatherService().fetchWeather(for: city)
                self.weather = result
            } catch {
                self.errorMessage = error.localizedDescription
            }
            isLoading = false
        }
    }
}
