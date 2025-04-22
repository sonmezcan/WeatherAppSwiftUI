//
//  ContentView.swift
//  WeatherAppSwiftUI
//
//  Created by can on 22.04.2025.
//

import SwiftUI

struct ContentView: View {
    @State private var cityName: String = ""
    @StateObject private var viewModel = WeatherViewModel()
    @State private var backgroundIcon: String = "default"
    @State private var hasSearched = false

    var body: some View {
        ZStack {
            WeatherTheme.gradient(for: backgroundIcon)
                .ignoresSafeArea()
                .animation(.easeInOut(duration: 0.6), value: backgroundIcon)

            GeometryReader { geometry in
                VStack {
                    Spacer(minLength: hasSearched ? 40 : geometry.size.height / 4)

                    VStack(spacing: 12) {
                        TextField("Enter a city to get weather conditions", text: $cityName)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.horizontal)
                            .onChange(of: cityName) {
                                if cityName.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                                    withAnimation(.spring(response: 0.5, dampingFraction: 0.7)) {
                                        hasSearched = false
                                    }
                                }
                            }

                        Button(action: {
                            withAnimation(.spring(response: 0.5, dampingFraction: 0.7)) {
                                if cityName.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                                    hasSearched = false
                                } else {
                                    hasSearched = true
                                }

                                UIApplication.shared.sendAction(
                                    #selector(UIResponder.resignFirstResponder),
                                    to: nil, from: nil, for: nil
                                )

                                viewModel.getWeather(for: cityName)
                            }
                        }) {
                            Text("Get Weather")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding(.horizontal, 24)
                                .padding(.vertical, 12)
                                .background(
                                    RoundedRectangle(cornerRadius: 12)
                                        .fill(Color.gray)
                                        .shadow(color: .black.opacity(0.2), radius: 8, x: 0, y: 4)
                                )
                        }
                    }
                    .padding()

                    if hasSearched {
                        Group {
                            if viewModel.isLoading {
                                ProgressView()
                                    .scaleEffect(1.5)
                                    .padding(.top, 40)
                            } else if let weather = viewModel.weather {
                                WeatherCardView(
                                    city: weather.name,
                                    temp: weather.main.temp,
                                    description: weather.weather.first?.description ?? "-",
                                    icon: weather.weather.first?.icon ?? "01d"
                                )
                                .onAppear {
                                    backgroundIcon = weather.weather.first?.icon ?? "default"
                                }
                                .padding(.top, 40)
                                .transition(.move(edge: .bottom).combined(with: .opacity))
                            } else if let error = viewModel.errorMessage {
                                Text("Error: \(error)")
                                    .foregroundColor(.red)
                                    .padding(.top, 40)
                            }
                        }
                        .animation(.easeInOut, value: viewModel.weather?.weather.first?.icon)
                    }

                    Spacer()
                }
                .frame(width: geometry.size.width, height: geometry.size.height)
            }
        }
        .ignoresSafeArea(.keyboard) // Klavye ekranı kaldırmasın
    }
}
#Preview {
    ContentView()
    
}
