# News App 📰
A professional, responsive, and multi-lingual News Application built with Flutter using **Clean Architecture** and **MVVM** patterns. This app provides real-time news updates across various categories with a high-performance and scalable structure.

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

## 🚀 Features

- **Multi-Category News**: Browse news from different sectors like Sports, Technology, Business, Health, Science, and Entertainment.
- **Source Filtering**: Filter news based on your favorite sources within each category.
- **In-App Search**: Powerful search functionality to find specific articles, enhanced with interactive **Lottie animations**.
- **Dark & Light Modes**: Full support for system and manual theme switching.
- **Localization**: Supports both **English** and **Arabic** with full RTL (Right-to-Left) support.
- **In-App WebView**: Read the full article without leaving the app using the integrated web view.
- **Responsive Design**: UI adapts perfectly to various screen sizes using **Flutter ScreenUtil**.
- **Pagination**: Efficiently loads news articles in chunks to ensure smooth scrolling and low data consumption.
- **Error Handling**: Custom "No Internet" and error states for a resilient user experience.

## 🏗️ Architecture & Design Patterns

This project follows **Clean Architecture** principles to ensure separation of concerns, testability, and maintainability:

- **MVVM (Model-View-ViewModel)**: Used for separating the UI logic from the business logic.
- **State Management**: Implemented using **Flutter BLoC (Cubit)** for predictable state transitions.
- **Dependency Injection**: Managed via **GetIt** and **Injectable** for automated and efficient service location.
- **Repository Pattern**: Abstracting data sources (Remote/Local) from the business logic layer.

## 🛠️ Tech Stack & Libraries

- **Logic & State**: 
  - [Flutter BLoC/Cubit](https://pub.dev/packages/flutter_bloc) for state management.
  - [Injectable](https://pub.dev/packages/injectable) & [GetIt](https://pub.dev/packages/get_it) for Dependency Injection.
- **Networking**: [Dio](https://pub.dev/packages/dio) for robust API requests.
- **UI & Layout**: 
  - [Flutter ScreenUtil](https://pub.dev/packages/flutter_screenutil) for adaptive sizing.
  - [Lottie](https://pub.dev/packages/lottie) for smooth vector animations.
  - [Flutter SVG](https://pub.dev/packages/flutter_svg) for high-quality icons.
- **Functionality**:
  - [Easy Localization](https://pub.dev/packages/easy_localization) for multi-language support.
  - [WebView Flutter](https://pub.dev/packages/webview_flutter) for in-app browsing.
  - [Cached Network Image](https://pub.dev/packages/cached_network_image) for optimized image loading.
  - [Shared Preferences](https://pub.dev/packages/shared_preferences) for local settings persistence.
  - [Timeago](https://pub.dev/packages/timeago) for human-readable timestamps.

## 📁 Project Structure

```text
lib/
├── core/
│   ├── di/               # Dependency Injection setup
│   ├── remote/           # API and Network logic
│   └── resources/        # Themes, Assets, Strings, and Constants
├── data/                 # Data Layer
│   ├── model/            # DTOs and Data Models
│   ├── repo_impl/        # Repository implementations
│   └── data_source_impl/ # API/Local data source implementations
├── ui/                   # Presentation Layer
│   ├── home/             # Categories, Articles, and Drawer
│   ├── search/           # Search functionality
│   └── view_model/       # Logic for specific UI components
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

---
Developed with ❤️ by **Mohamed Shaban**.
