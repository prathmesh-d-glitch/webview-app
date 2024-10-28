# Game Platform WebView App

This app is a WebView-based Flutter application designed to provide a seamless browsing experience across multiple game platforms. It includes a dynamic tab bar, smooth progress indicators, efficient navigation controls, and optimized performance. The app follows a clean architecture pattern, separating the app into different layers (presentation, domain, data) and is built for modularity, scalability, and ease of maintenance. State management is efficiently handled using Riverpod.
---

## Features

- **Smooth WebView Integration**: 
  - Seamless back and forward navigation.
  - Smooth progress indicator while loading.
  - Pull-to-refresh functionality.
  - Error handling for failed page loads and no internet connection.
- **Dynamic Tab Bar**: 
  - Collapsing tab bar for different game platforms which on double tab minimizes.
  - Dropdown navigation for easy switching between game platform URLs.
- **Clean Architecture**: 
  - Organized in layers (presentation, model,providers, screens, data) to maintain modularity and scalability.
- **Performance Optimizations**:
  - Enhanced WebView performance with caching.
  - Efficient resource loading for smooth scrolling and navigation.
- **State Management with Riverpod**: 
  - Efficient state handling for UI updates and error handling.

## Architecture

This app follows the clean architecture principles with three main layers:

- **Screens**: Contains individual screens, including the WebView and other UI pages.
- **Providers**: Manages state and dependencies using Riverpod.
- **Routes**: Configures app navigation, using `go_router` for a scalable routing setup.
- **Widgets**: Reusable UI components like the dynamic tab bar, loading indicators, etc.
- **Core**: Holds core utilities, error handling classes, constants, and configurations shared across the app.


The state management is implemented using **Riverpod** for a reactive approach to handle UI state updates effectively.

## Dependencies

This app uses the following Flutter packages:

| Package              | Version |
|----------------------|---------|
| `flutter_riverpod`   | ^2.6.1  |
| `go_router`          | ^7.0.0  |
| `webview_flutter`    | ^4.10.0 |
| `connectivity_plus`  | ^6.1.0  |

Make sure these dependencies are added to your `pubspec.yaml` file.

## How to Run the App

Follow these steps to run the app on your device or emulator:

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/your-username/game-platform-webview-app.git
   cd game-platform-webview-app
2. **Install Dependencies**:  
   Use the following command to install all necessary dependencies:
   flutter pub get
3. **Configure Permissions**:
   Android: Open android/app/src/main/AndroidManifest.xml and ensure the following permission is added:
      <uses-permission android:name="android.permission.INTERNET"/>
   iOS: Open ios/Runner/Info.plist and add the following:

      <key>NSAppTransportSecurity</key>
      <dict>
          <key>NSAllowsArbitraryLoads</key>
        <true/>
      </dict>
4. **Run the App**:
      flutter run


 
