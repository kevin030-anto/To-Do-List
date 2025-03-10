# 📌 To-Do List

## 📝 Description
A simple one-page **To-Do List App** built using Flutter. This app allows users to add, delete, and mark tasks as completed.

---

## 📷 Sample Screenshot
![To-Do List Screenshot](https://github.com/kevin030-anto/To-Do-List/blob/main/Screenshot%20To-Do%20List.png)


---

## 🛠️ Installation & Setup
1. **Clone the repository**
   ```sh
   git clone https://github.com/kevin030-anto/To-Do-List.git
   cd To-Do-List
   ```

2. **Install dependencies**
   ```sh
   flutter pub get
   ```

3. **Run the app** (on an emulator or real device)
   ```sh
   flutter run
   ```

---

## 🚀 Build & Run Instructions
### 🏗️ To Build the App

| **Platform** | **Build Command** | **Output** | **Location** |
|--------------|------------------|---------------------|------------------|
| **Android (APK)**  | `flutter build apk`  | `app-release.apk` | ..\To-Do-List\todo app flutter\build\app\outputs\flutter-apk\app-release.apk |
| **Android (AAB)**  | `flutter build appbundle`  | `app-release.aab` | ..\To-Do-List\todo app flutter\build\app\outputs\flutter-apk\app-release.aab |
| **APK (Split by Architecture)** | `flutter build apk --split-per-abi` | >`app-arm64-v8a-release.apk` >`app-armeabi-v7a-release.apk` >`app-x86_64-release.apk` | ..\To-Do-List\todo app flutter\build\app\outputs\flutter-apk\ |
| **iOS (Debug)**  | `flutter build ios --no-codesign`  | `.app (for testing)` | ..\To-Do-List\todo app flutter\build\ios\ipa\ |
| **iOS (Release)**  | `flutter build ipa`  | `.ipa (for App Store)` | ..\To-Do-List\todo app flutter\build\ios\ipa\ |

**NOTE:**

APK (Split by Architecture) => It create smaller APKs for different architectures

To Building an iOS App Xcode is required (macOS only)

---

## 📌 Features
✅ Add new tasks  
✅ Mark tasks as complete/incomplete  
✅ Delete tasks  
✅ Simple UI with easy navigation  

---

## 📜 License
This project is licensed under the MIT License.

---

### 💻 Built With
- Flutter
- Dart
- SQLite (for local storage)

---
