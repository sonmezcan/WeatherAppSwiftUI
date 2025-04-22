//
//  WeatherCardView.swift
//  WeatherAppSwiftUI
//
//  Created by can on 22.04.2025.
//


import SwiftUI

struct WeatherCardView: View {
    let city: String
    let temp: Double
    let description: String
    let icon: String

    var body: some View {
        VStack(spacing: 16) {
            Text(city)
                .font(.title)
                .fontWeight(.semibold)

            AsyncImage(url: URL(string: "https://openweathermap.org/img/wn/\(icon)@2x.png")) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
            } placeholder: {
                ProgressView()
            }

            Text("\(Int(temp))°C")
                .font(.system(size: 42, weight: .bold))
                .foregroundColor(.white)

            Text(description.capitalized)
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(
            
            RoundedRectangle(cornerRadius: 20)
                .fill(.ultraThinMaterial)
                .shadow(radius: 10)
        )
        .padding(.horizontal)
        .transition(.opacity.combined(with: .move(edge: .bottom)))
        .animation(.spring(), value: city)
        
    }
}
