# Test app
---
Built using BloC architecture.

#### Functionality:

 ☑ Geolocation and Internet connetcion service ✨
 ☑ Google Map ✨
 
## How to start 
---
```dart
git clone https://github.com/weluid/maxopen_test.git
cd maxopen_test
flutter packages get
flutter run
```
## Setup Android/IOS with Google Map API key
Android:
Specify your API key in the application manifest android/app/src/main/AndroidManifest.xml:
```dart
<manifest ...
  <application ...
    <meta-data android:name="com.google.android.geo.API_KEY"
               android:value="API-KEY"/>
```
IOS:
Specify your API key in the application delegate ios/Runner/AppDelegate.swift:
```dart
 GMSServices.provideAPIKey("API-KEY")
```

## Tech
---
Libraries used in the project:

- [Bloc] - makes it easy to separate UI from business logic, making code fast and reusable
- [Connectivity Plus] - allows Flutter apps to discover network connectivity
- [Geolocator] - provides easy access to location services



   [Bloc]: <https://pub.dev/packages/flutter_bloc>
   [Connectivity Plus]: <https://pub.dev/packages/connectivity_plus>
   [Geolocator]: <https://pub.dev/packages/geolocator>
>
