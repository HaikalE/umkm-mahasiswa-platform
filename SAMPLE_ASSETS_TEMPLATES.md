# 🎨 SAMPLE ASSETS TEMPLATES

## 📁 ASSET FILES TO CREATE:

### **Quick Start Assets (Copy these files to your assets folder)**

### **1. App Logo Placeholder (SVG)**
Create: `assets/images/logos/app_logo.svg`
```svg
<svg width="120" height="120" viewBox="0 0 120 120" fill="none" xmlns="http://www.w3.org/2000/svg">
  <rect width="120" height="120" rx="30" fill="#2E7D8F"/>
  <path d="M30 45C30 39.4772 34.4772 35 40 35H50C55.5228 35 60 39.4772 60 45V50H80C85.5228 50 90 54.4772 90 60V80C90 85.5228 85.5228 90 80 90H40C34.4772 90 30 85.5228 30 80V45Z" fill="white"/>
  <circle cx="45" cy="52.5" r="7.5" fill="#2E7D8F"/>
  <circle cx="75" cy="77.5" r="7.5" fill="#2E7D8F"/>
  <path d="M52.5 60L67.5 70" stroke="#2E7D8F" stroke-width="3" stroke-linecap="round"/>
</svg>
```

### **2. Category Icons (SVG)**

**Food Icon:** `assets/icons/categories/food.svg`
```svg
<svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
  <path d="M8.1 13.34L2 20.98L3.02 22L9.36 15.66L12 18.34L14.64 15.66L20.98 22L22 20.98L15.89 13.34L18.15 7.88C18.64 6.7 18.17 5.26 17.05 4.55C15.92 3.84 14.58 4.32 13.87 5.45L12 8.69L10.13 5.44C9.42 4.32 8.08 3.84 6.95 4.55C5.83 5.26 5.36 6.7 5.85 7.88L8.1 13.34Z" fill="currentColor"/>
</svg>
```

**Tech Icon:** `assets/icons/categories/tech.svg`
```svg
<svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
  <path d="M4 6V18H20V6H4ZM20 4C21.11 4 22 4.89 22 6V18C22 19.11 21.11 20 20 20H4C2.89 20 2 19.11 2 18V6C2 4.89 2.89 4 4 4H20ZM12 15L17 10H14V8H20V14H18V11L13 16H16V18H10V12H12V15Z" fill="currentColor"/>
</svg>
```

**Fashion Icon:** `assets/icons/categories/fashion.svg`
```svg
<svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
  <path d="M12 2C13.1 2 14 2.9 14 4C14 5.1 13.1 6 12 6C10.9 6 10 5.1 10 4C10 2.9 10.9 2 12 2ZM21 9V7L15 8L13.5 7C13.1 6.8 12.6 6.8 12.2 7L10.5 8L4.5 7V9L10 10L8 22H10L12 12L14 22H16L14 10L21 9Z" fill="currentColor"/>
</svg>
```

### **3. Navigation Icons (SVG)**

**Home Icon:** `assets/icons/navigation/home.svg`
```svg
<svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
  <path d="M10 20V14H14V20H19V12H22L12 3L2 12H5V20H10Z" fill="currentColor"/>
</svg>
```

**Projects Icon:** `assets/icons/navigation/projects.svg`
```svg
<svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
  <path d="M19 3H5C3.9 3 3 3.9 3 5V19C3 20.1 3.9 21 5 21H19C20.1 21 21 20.1 21 19V5C21 3.9 20.1 3 19 3ZM19 19H5V5H19V19ZM7 10H9V17H7V10ZM11 7H13V17H11V7ZM15 13H17V17H15V13Z" fill="currentColor"/>
</svg>
```

**Profile Icon:** `assets/icons/navigation/profile.svg`
```svg
<svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
  <path d="M12 2C13.1 2 14 2.9 14 4C14 5.1 13.1 6 12 6C10.9 6 10 5.1 10 4C10 2.9 10.9 2 12 2ZM21 9V7L15 8L13.5 7C13.1 6.8 12.6 6.8 12.2 7L10.5 8L4.5 7V9L10 10L8 22H10L12 12L14 22H16L14 10L21 9Z" fill="currentColor"/>
</svg>
```

## 🚀 QUICK SETUP COMMANDS:

### **Create Assets Folder Structure:**
```bash
# Run these commands in your project root:
mkdir -p assets/images/logos
mkdir -p assets/images/onboarding  
mkdir -p assets/images/illustrations
mkdir -p assets/images/avatars
mkdir -p assets/icons/categories
mkdir -p assets/icons/skills
mkdir -p assets/icons/navigation
mkdir -p assets/animations
```

### **Test Assets Integration:**
Create this test file: `lib/core/utils/assets.dart`
```dart
class Assets {
  // Logos
  static const String appLogo = 'assets/images/logos/app_logo.svg';
  static const String appLogoWhite = 'assets/images/logos/app_logo_white.svg';
  
  // Category Icons
  static const String foodIcon = 'assets/icons/categories/food.svg';
  static const String techIcon = 'assets/icons/categories/tech.svg';
  static const String fashionIcon = 'assets/icons/categories/fashion.svg';
  
  // Navigation Icons  
  static const String homeIcon = 'assets/icons/navigation/home.svg';
  static const String projectsIcon = 'assets/icons/navigation/projects.svg';
  static const String profileIcon = 'assets/icons/navigation/profile.svg';
  
  // Placeholder Images
  static const String placeholderAvatar = 'assets/images/avatars/placeholder.png';
  static const String emptyState = 'assets/images/illustrations/empty_state.png';
}
```

## 📱 USAGE EXAMPLES:

### **Using SVG Icons:**
```dart
import 'package:flutter_svg/flutter_svg.dart';

// Category icon
SvgPicture.asset(
  Assets.foodIcon,
  width: 24,
  height: 24,
  color: AppColors.primary,
)

// Navigation icon
SvgPicture.asset(
  Assets.homeIcon,
  width: 20,
  height: 20,
  color: isSelected ? AppColors.primary : AppColors.grey500,
)
```

### **Using Images:**
```dart
// App logo
Image.asset(
  Assets.appLogo,
  width: 120,
  height: 120,
)

// Placeholder avatar
CircleAvatar(
  radius: 30,
  backgroundImage: AssetImage(Assets.placeholderAvatar),
)
```

### **Using in Lists:**
```dart
// Category list with icons
ListTile(
  leading: SvgPicture.asset(
    Assets.techIcon,
    width: 24,
    height: 24,
    color: AppColors.primary,
  ),
  title: Text('Technology', style: AppTypography.bodyMedium),
  subtitle: Text('Web & Mobile Development', style: AppTypography.caption),
)
```

## 🎨 DESIGN TIPS:

### **Icon Guidelines:**
- **Size**: 24x24px for category icons, 20x20px for navigation
- **Color**: Use `currentColor` in SVG for easy theming
- **Style**: Outline style for consistency
- **Format**: SVG preferred for scalability

### **Image Guidelines:**
- **Format**: PNG for photos/complex images, SVG for icons
- **Size**: Keep under 500KB per image
- **Resolution**: 2x for retina displays
- **Naming**: lowercase_with_underscores.extension

### **Folder Organization:**
```
assets/
├── images/
│   ├── logos/          # Brand assets
│   ├── onboarding/     # Flow illustrations  
│   ├── illustrations/  # UI states
│   └── avatars/        # Profile placeholders
├── icons/
│   ├── categories/     # Business categories
│   ├── skills/         # Student skills
│   └── navigation/     # App navigation
└── animations/         # Lottie files
    ├── loading.json
    └── success.json
```

## ✅ RESULT AFTER ADDING ASSETS:

**Your app will have:**
- ✅ **Professional Branding** (custom logo)
- ✅ **Visual Categories** (icon-based navigation)
- ✅ **Consistent Icons** (unified design language)
- ✅ **Placeholder Content** (graceful empty states)
- ✅ **Scalable Graphics** (SVG icons that work on all screens)

**Ready to make your app look professional! 🎨**