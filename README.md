# News App 📰

A modern, responsive, and multi-lingual News Application built with Flutter. This app provides real-time news updates across various categories, featuring a sleek UI with support for both Light and Dark modes.

## 🚀 Features

- **Multi-Category News**: Browse news from different sectors like Sports, Technology, Business, Health, Science, and Entertainment.
- **Source Filtering**: Filter news based on your favorite sources within each category.
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
├── model/                # Data models for Articles and Sources
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

## 📸 Screenshots

*(Add your screenshots here later)*

---
Developed with Mohamed Shaban.
