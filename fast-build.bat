@echo off
echo ================================================
echo    UMKM MAHASISWA PLATFORM - FAST BUILD SCRIPT
echo ================================================
echo.

REM Kill existing Gradle processes
echo [1/5] Killing existing Gradle processes...
taskkill /f /im java.exe >nul 2>&1

REM Clean build cache
echo [2/5] Cleaning build cache...
if exist "build" rmdir /s /q "build"
if exist "android\build" rmdir /s /q "android\build"
if exist "android\.gradle" rmdir /s /q "android\.gradle"
if exist "android\app\build" rmdir /s /q "android\app\build"

REM Flutter clean
echo [3/5] Flutter clean...
flutter clean

REM Get dependencies
echo [4/5] Getting dependencies...
flutter pub get

REM Fast build and run
echo [5/5] Building and running app (FAST MODE)...
flutter run --debug --fast-start --no-sound-null-safety --disable-service-auth-codes

echo.
echo ================================================
echo              BUILD COMPLETED!
echo ================================================
pause