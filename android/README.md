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

### 2. ⚡ FAST BUILD (Recommended)
```bash
# Gunakan script fast build
./fast-build.bat
```

### 3. Manual Build
```bash
# Dari root project
flutter clean
flutter pub get
flutter run
```

## ⚡ Build Speed Optimizations

### 🔥 **SUDAH DIOPTIMASI:**
- ✅ **Memory:** 4GB heap allocation
- ✅ **Parallel builds:** Multi-threading enabled
- ✅ **Caching:** Gradle cache enabled
- ✅ **Skip tests:** Auto-skip untuk debug builds
- ✅ **Disable lint:** Faster debug builds
- ✅ **Pre-dex:** Libraries pre-processed
- ✅ **Configuration cache:** Experimental speedup

### 🚀 **TIPS MANUAL UNTUK BUILD LEBIH CEPAT:**

```bash
# 1. Build pertama kali (paling lama)
flutter run

# 2. Build selanjutnya (hot reload)
# Tekan 'r' di terminal untuk hot reload
# Tekan 'R' untuk hot restart

# 3. Build dengan mode fast-start
flutter run --fast-start

# 4. Skip unnecessary checks
flutter run --no-sound-null-safety

# 5. Build dengan cache lebih agresif
flutter run --enable-software-rendering
```

## 🔧 Troubleshooting

### Error: Gradle Timeout / Build Lama
```bash
# Method 1: Use fast-build script
./fast-build.bat

# Method 2: Kill processes dan clean cache
taskkill /f /im java.exe
rmdir /s "C:\Users\YourName\.gradle"
flutter clean && flutter pub get && flutter run

# Method 3: Increase system RAM allocation
# Edit android/gradle.properties:
# org.gradle.jvmargs=-Xmx6144M (if you have 8GB+ RAM)
```

### Error: SDK not found
```properties
# File: android/local.properties
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

## ⚡ Build Performance

| Build Type | First Build | Subsequent Builds | Hot Reload |
|------------|-------------|------------------|------------|
| **Debug**  | ~2-5 min    | ~30-60 sec       | ~1-3 sec   |
| **Release**| ~5-10 min   | ~2-3 min         | N/A        |

## 🎯 Build Modes

```bash
# Development (fastest)
flutter run --debug

# Testing
flutter run --profile

# Production (slowest, most optimized)
flutter run --release
```

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
│   ├── build.gradle (OPTIMIZED ⚡)
│   └── proguard-rules.pro
├── gradle/wrapper/
├── build.gradle
├── gradle.properties (OPTIMIZED ⚡)
├── settings.gradle
└── README.md
```

## 🆘 Need Help?

Jika masih ada masalah, coba:
1. **GUNAKAN SCRIPT:** `./fast-build.bat`
2. Buka Android Studio → Open project → pilih folder `android`
3. Sync project
4. Clean & Rebuild project

## 🏆 Pro Tips

- **First build:** Biarkan sampai selesai (mungkin 5-10 menit)
- **Development:** Gunakan hot reload (`r` di terminal)
- **Testing:** Gunakan `flutter run --profile`
- **Fast start:** `flutter run --fast-start`
- **Clean cache:** Jalankan `flutter clean` seminggu sekali