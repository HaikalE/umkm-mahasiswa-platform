# Android Setup untuk UMKM Mahasiswa Platform

## 🚀 Quick Start

### 1. Setup Local Properties
```bash
# Copy dan edit local.properties
cp local.properties.example local.properties
```

Edit `local.properties` dengan path Flutter SDK kamu:
```properties
flutter.sdk=C:\\path\\to\\your\\flutter
sdk.dir=C:\\path\\to\\your\\android\\sdk
```

### 2. Build Project
```bash
# Dari root project
flutter clean
flutter pub get
flutter run
```

## 🔧 Troubleshooting

### Error: Gradle Timeout
1. Kill semua proses Java/Gradle:
   ```bash
   taskkill /f /im java.exe
   ```

2. Hapus cache Gradle:
   ```bash
   rmdir /s "C:\Users\YourName\.gradle"
   ```

3. Build ulang:
   ```bash
   flutter clean && flutter pub get && flutter run
   ```

### Error: SDK not found
Pastikan file `local.properties` berisi path yang benar:
```properties
flutter.sdk=C:\\flutter
sdk.dir=C:\\Users\\YourName\\AppData\\Local\\Android\\sdk
```

### Error: No devices
- Sambungkan device Android dengan USB Debugging aktif
- Atau jalankan Android Emulator
- Check: `flutter devices`

## 📱 App Configuration

- **Package Name:** `com.umkm.mahasiswa.platform`
- **App Name:** UMKM Mahasiswa Platform
- **Min SDK:** 21 (Android 5.0)
- **Target SDK:** 34 (Android 14)
- **Deep Link:** `umkm://`

## 🔐 Features Enabled

- ✅ Firebase Integration
- ✅ Camera & Storage Permissions
- ✅ Network Access
- ✅ Deep Linking
- ✅ Push Notifications
- ✅ Multi-dex Support

## 📋 File Structure

```
android/
├── app/
│   ├── src/main/
│   │   ├── kotlin/com/umkm/mahasiswa/platform/
│   │   │   ├── MainActivity.kt
│   │   │   └── FirebaseMessagingService.kt
│   │   ├── res/
│   │   │   ├── values/styles.xml
│   │   │   └── drawable/launch_background.xml
│   │   └── AndroidManifest.xml
│   └── build.gradle
├── gradle/wrapper/
├── build.gradle
├── gradle.properties
└── settings.gradle
```

## 🆘 Need Help?

Jika masih ada masalah, coba:
1. Buka Android Studio → Open project → pilih folder `android`
2. Sync project
3. Clean & Rebuild project