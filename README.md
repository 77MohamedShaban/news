# News App 📰

A modern, responsive, and multi-lingual News Application built with Flutter. This app provides real-time news updates across various categories, featuring a sleek UI with support for both Light and Dark modes.

## 📸 Screenshots [ dark mode ]
<p align="center">
  <img src="https://github.com/user-attachments/assets/794aa6d7-3f0b-420f-9880-185daf27ffef" height="350"/>
  <img src="https://github.com/user-attachments/assets/9d8a44c8-ad32-4e3c-98b9-399fb5a0ada2" height="350"/>
  <img src="https://github.com/user-attachments/assets/ec55a80b-ba43-4364-912e-21584eca1372" height="350"/>
  <img src="https://github.com/user-attachments/assets/1277a373-9221-4b50-96e3-05a5621503bf" height="350"/>
   <img src="https://github.com/user-attachments/assets/d63facf6-79de-4af4-bdb6-0887252b6c80" height="350"/>
  <img src="https://github.com/user-attachments/assets/1e39dca0-6e38-49ac-bc0d-817d17e6b53a" height="350"/>
  <img src="https://github.com/user-attachments/assets/b70a7cdf-82b4-49d8-ba74-a6e9c0e14a79" height="350"/>
  <img src="https://github.com/user-attachments/assets/67486be9-2321-40f6-aeb2-ed16e2487710" height="350"/>
  <img src="https://github.com/user-attachments/assets/233072b3-8592-44d0-a400-cde358676ff6" height="350"/>
</p>

## 🎬 Demo

👉 Watch Demo Video: https://www.linkedin.com/posts/mohamed-shaban-480019398_flutter-mobiledevelopment-opentowork-ugcPost-7455005904669720576-Kyet?utm_source=share&utm_medium=member_desktop&rcm=ACoAAGGI0GABNB-j_SY7kBI5UbRrqZX0uGYNWw8

## 🏗️ Architecture
​
 - **MVVM (Model-View-ViewModel)**: The project follows the MVVM architectural pattern to ensure a clean separation of concerns, making the code more maintainable, testable, and scalable.
   - **Model**: Represents the data structures and business logic.
   - **View**: The UI layer built with Flutter widgets.
   - **ViewModel**: Acts as a bridge between the Model and the View, handling the UI logic and state management using **Provider**.
---
## 🚀 Features

- **Multi-Category News**: Browse news from different sectors like Sports, Technology, Business, Health, Science, and Entertainment.
- **Source Filtering**: Filter news based on your favorite sources within each category.
- **Custom Pagination**: Optimized data loading for large lists of articles to ensure smooth scrolling and better performance.
- **In-App Search**: Powerful search functionality to find specific articles, enhanced with interactive Lottie animations.
- **Dark & Light Modes**: Full support for system and manual theme switching for a comfortable reading experience.
- **Localization**: Supports both **English** and **Arabic** languages with RTL support.
- **In-App WebView**: Read the full article without leaving the app using the integrated web view.
- **Responsive Design**: UI adapts perfectly to various screen sizes using `flutter_screenutil`.
- **Offline Readiness**: Basic caching and error handling for "No Internet" scenarios.

## 🛠️ Tech Stack & Libraries

- **State Management**: [Provider](https://pub.dev/packages/provider) for efficient app state and theme management.
- **Networking**: [Dio](https://pub.dev/packages/dio) for robust API requests.
- **UI & Layout**: 
  - [Flutter ScreenUtil](https://pub.dev/packages/flutter_screenutil) for responsive UI.
  - [Lottie](https://pub.dev/packages/lottie) for high-quality animations.
  - [Flutter SVG](https://pub.dev/packages/flutter_svg) for vector graphics.
- **Functionality**:
  - [Easy Localization](https://pub.dev/packages/easy_localization) for multi-language support.
  - [Cached Network Image](https://pub.dev/packages/cached_network_image) for optimized image loading.
  - [WebView Flutter](https://pub.dev/packages/webview_flutter) for in-app browsing.
  - [Shared Preferences](https://pub.dev/packages/shared_preferences) for local data persistence (Theme/Language).
  - [Timeago](https://pub.dev/packages/timeago) for human-readable timestamps.

## 📁 Project Structure

```text
lib/
├── core/
│   ├── remote/           # API and Local Storage logic
│   └── resources/        # Themes, Assets, Strings, and Constants
├── data/model/                # Data models for Articles and Sources
├── providers/            # State providers (e.g., ThemeProvider)
├── ui/                   # UI Screens and Widgets
│   ├── home/             # Main dashboard, Categories, and Articles list
│   ├── search/           # Search functionality
│   └── reusable_component/ # Shared UI components
└── main.dart             # Application entry point
```

## ⚙️ Setup & Installation

1. **Clone the repository**:
   ```bash
   git clone https://github.com/your-username/news-app.git
   ```

2. **Install dependencies**:
   ```bash
   flutter pub get
   ```

3. **API Key**:
   The app uses [NewsAPI](https://newsapi.org/). Ensure your API key is correctly set in `lib/core/remote/network/api_manager.dart`.

4. **Run the app**:
   ```bash
   flutter run
   ```
Developed with Mohamed Shaban.
