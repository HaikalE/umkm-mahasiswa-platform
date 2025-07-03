# 🚀 SPEED UP BUILD TIPS

## ⚡ LANGSUNG PAKAI INI UNTUK BUILD CEPAT!

### 1. **TERMUDAH - Gunakan Script:**
```bash
git pull origin main
./fast-build.bat
```

### 2. **MANUAL - Commands Cepat:**
```bash
# Kill proses gradle yang nyangkut
taskkill /f /im java.exe

# Build dengan flag optimasi
flutter run --debug --fast-start --no-sound-null-safety

# Atau build dengan cache agresif
flutter run --enable-software-rendering --fast-start
```

### 3. **FIRST TIME BUILD (Lama tapi sekali aja):**
```bash
flutter clean
flutter pub get
flutter run
# Tunggu 5-10 menit untuk pertama kali
# Build selanjutnya cuma 30-60 detik!
```

### 4. **DEVELOPMENT MODE (Paling Cepat):**
Setelah app jalan, gunakan hot reload:
- Tekan `r` untuk hot reload (1-3 detik)
- Tekan `R` untuk hot restart (5-10 detik)
- Tekan `q` untuk quit

### 5. **SKIP GRADLE MANUAL:**
Jika gradle error terus:
```bash
# Langsung pakai Flutter aja
flutter run --no-build-gradle-cache --verbose
```

## 🔥 OPTIMASI YANG SUDAH DITERAPKAN:

✅ **Memory:** 4GB heap (dari 1.5GB default)  
✅ **Parallel:** Multi-threading enabled  
✅ **Cache:** Gradle cache + configuration cache  
✅ **Skip:** Lint checks, unnecessary tests  
✅ **Pre-dex:** Libraries pre-processed  
✅ **No minify:** Debug builds tanpa optimasi  
✅ **No lint:** Skip lint untuk debug  

## ⏱️ **EXPECTED BUILD TIMES:**

| Kondisi | Waktu Build |
|---------|-------------|
| **First build** | 5-10 menit ⏳ |
| **Clean build** | 2-3 menit ⏳ |
| **Incremental build** | 30-60 detik ✅ |
| **Hot reload** | 1-3 detik ⚡ |

## 🆘 **JIKA MASIH LAMA:**

1. **Restart Android Studio/VS Code**
2. **Restart komputer** (clear semua cache)
3. **Gunakan SSD** (bukan HDD)
4. **Close aplikasi lain** (Chrome, games, dll)
5. **Increase RAM** virtual memory Windows

## 💡 **PRO TIPS:**

- Build pertama emang lama, sabar aja!
- Setelah itu pakai hot reload terus
- Jangan `flutter clean` kecuali perlu
- Pakai `fast-build.bat` untuk reset total