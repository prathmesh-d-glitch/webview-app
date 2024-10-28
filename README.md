
# Game Platform WebView App

This is a **WebView-based Flutter application** crafted for a seamless browsing experience across various game platforms. The app integrates a dynamic tab bar, smooth progress indicators, efficient navigation controls, and optimized performance. Designed with a **clean architecture pattern**, it ensures modularity, scalability, and ease of maintenance, with **Riverpod** managing state efficiently.

---

## Features

- ### **Smooth WebView Integration**
  - Seamless back and forward navigation.
  - Smooth progress indicator for loading feedback.
  - Pull-to-refresh functionality.
  - Robust error handling for failed page loads and network issues.
  
- ### **Dynamic Tab Bar**
  - Collapsing tab bar for different game platforms, with a double-tap to minimize.
  - Navigation for easy platform switching.

- ### **Clean Architecture**
  - Organized into layers (presentation, model, providers, screens, data) for modularity and scalability.

- ### **Performance Optimizations**
  - Enhanced WebView performance with caching for faster loads.
  - Efficient resource loading for smooth scrolling and navigation.

- ### **State Management with Riverpod**
  - Reactive state handling to ensure efficient UI updates and error management.

---

## Architecture Overview

This app is built with **clean architecture principles** using a layered approach:

- **Screens**: Holds individual screens, including the WebView and other UI pages.
- **Providers**: Manages state and dependencies using Riverpod.
- **Routes**: Configures app navigation with `go_router` for scalable routing.
- **Widgets**: Houses reusable UI components like the dynamic tab bar, loading indicators, etc.
- **Core**: Contains core utilities, error handling classes, constants, and shared configurations.

State management is implemented with **Riverpod** for an efficient and reactive approach to UI state updates.

---

## Dependencies

The app relies on the following Flutter packages:

| Package              | Version |
|----------------------|---------|
| `flutter_riverpod`   | ^2.6.1  |
| `go_router`          | ^7.0.0  |
| `webview_flutter`    | ^4.10.0 |
| `connectivity_plus`  | ^6.1.0  |

Ensure these dependencies are included in your `pubspec.yaml` file.

---

## Getting Started

Follow these steps to set up and run the app:

### 1. **Clone the Repository**
   ```bash
   git clone https://github.com/your-username/game-platform-webview-app.git
   cd game-platform-webview-app
   ```

### 2. **Install Dependencies**  
   Install all required dependencies:
   ```bash
   flutter pub get
   ```

### 3. **Configure Permissions**

   **For Android**: Open `android/app/src/main/AndroidManifest.xml` and add the following:
   ```xml
   <uses-permission android:name="android.permission.INTERNET"/>
   ```

   **For iOS**: Open `ios/Runner/Info.plist` and add:
   ```xml
   <key>NSAppTransportSecurity</key>
   <dict>
       <key>NSAllowsArbitraryLoads</key>
       <true/>
   </dict>
   ```

### 4. **Build the APK**

   To build the APK for your app, run the following command:
   ```bash
   flutter build apk
   ```

   The generated APK file will be located at `build/app/outputs/flutter-apk/app-release.apk`. You can find the APK in this path after a successful build.

### 5. **Run the App on Android**

   To run the app on an Android device or emulator, use:
   ```bash
   flutter run
   ```

---
