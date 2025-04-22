# 🌤️ SwiftUI Weather App

An interactive and user-centered weather app built with **SwiftUI**, featuring real-time city-based weather data, smooth animations, and responsive layout. Powered by the OpenWeatherMap API.

---

## 🎯 Features

- 🔎 Search weather by city name
- ⏱️ Real-time weather info from OpenWeatherMap
- 🌈 Weather-based dynamic background (`LinearGradient`)
- 🧭 Adaptive layout using `GeometryReader` and `Spacer`
- 📱 SwiftUI animations with `withAnimation` and `transition`
- 📷 Weather icon loaded via `AsyncImage`
- 🎯 Keyboard management with `UIApplication.shared.sendAction(...)`
- 📲 Prevents layout shift using `.ignoresSafeArea(.keyboard)`
- 🧠 Modular, testable, and reusable components

---

## 🧪 UX Highlights

- TextField and Button start centered  
- On search, they smoothly animate upward  
- Result card appears with a subtle transition  
- If input is cleared, everything resets with animation  
- Keyboard dismisses automatically after search

---

## 🛠️ Tech Stack

- **Language:** Swift 5.9  
- **Framework:** SwiftUI  
- **API:** OpenWeatherMap  
- **Data Flow:** `@StateObject`, `onChange`, ViewModel pattern  
- **Architecture:** Reactive + Declarative + Animation-Driven UI

---

## 🚀 Getting Started

1. Clone the repository  
   ```bash
   git clone https://github.com/sonmezcan/WeatherAppSwiftUI.git
2.	Open the project in Xcode
3.	Go to WeatherService.swift and replace the placeholder with your OpenWeatherMap API key:
    	let apiKey = "YOUR_API_KEY"
4.	Build and run the app on a simulator or real device (iOS 16+ recommended)

   🙋‍♂️ About the Author

Hi! I’m Uraz Sönmez, a senior iOS developer passionate about building clean, scalable, and user-friendly apps with modern Apple technologies.
	•	🧠 Portfolio: linkedin.com/in/uraz-sönmez
	•	💬 Connect: GitHub @sonmezcan

⸻

⭐️ If you like this project…

Don’t forget to star ⭐️, fork 🍴, and share it with fellow developers.
  	
