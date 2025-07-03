# Firebase Setup Guide

Firebase sudah dinonaktifkan sementara agar aplikasi bisa berjalan tanpa konfigurasi Firebase. Untuk mengaktifkan Firebase, ikuti langkah-langkah berikut:

## Langkah 1: Setup Firebase Project

1. Buka [Firebase Console](https://console.firebase.google.com/)
2. Buat project baru dengan nama "umkm-mahasiswa-platform"
3. Enable Google Analytics (opsional)

## Langkah 2: Setup Android App

1. Di Firebase Console, klik "Add app" > Android
2. Package name: `com.example.umkm_mahasiswa_platform`
3. App nickname: `UMKM Mahasiswa Platform`
4. Download file `google-services.json`
5. Letakkan file tersebut di `android/app/google-services.json`

## Langkah 3: Update Dependencies

Uncomment baris Firebase di `pubspec.yaml`:

```yaml
# Firebase
firebase_core: ^2.24.2
firebase_auth: ^4.15.3
firebase_messaging: ^14.7.10
firebase_analytics: ^10.7.4
```

## Langkah 4: Update Code

Uncomment baris Firebase di `lib/main.dart`:

```dart
import 'package:firebase_core/firebase_core.dart';

// Di fungsi main():
await Firebase.initializeApp();
```

## Langkah 5: Jalankan Commands

```bash
flutter clean
flutter pub get
flutter run
```

## Firebase Services yang Akan Digunakan

- **Authentication**: Login/Register dengan email dan Google
- **Cloud Messaging**: Push notifications
- **Analytics**: User behavior tracking
- **Crashlytics**: Error monitoring (akan ditambahkan nanti)

## Struktur Database (Firestore)

```
users/
  {userId}/
    - name: string
    - email: string
    - userType: "student" | "umkm"
    - createdAt: timestamp
    - profileSetupCompleted: boolean

projects/
  {projectId}/
    - title: string
    - description: string
    - budget: number
    - deadline: timestamp
    - umkmId: string
    - status: "open" | "in_progress" | "completed"

chats/
  {chatId}/
    - participants: array
    - lastMessage: string
    - lastMessageTime: timestamp
```

## Environment Variables

Buat file `.env` di root project:

```
FIREBASE_PROJECT_ID=umkm-mahasiswa-platform
FIREBASE_API_KEY=your_api_key_here
```

**Note**: File `.env` sudah ada di `.gitignore` untuk keamanan.
