import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  // Primary Colors
  static const Color primary = Color(0xFF2E7D8F);
  static const Color primaryLight = Color(0xFF4A9BAF);
  static const Color primaryDark = Color(0xFF1A5A6B);
  
  // Secondary Colors
  static const Color secondary = Color(0xFFF39C12);
  static const Color secondaryLight = Color(0xFFF5B041);
  static const Color secondaryDark = Color(0xFFE67E22);
  
  // Accent Colors
  static const Color accent = Color(0xFFE74C3C);
  static const Color success = Color(0xFF27AE60);
  static const Color warning = Color(0xFFF1C40F);
  static const Color error = Color(0xFFE74C3C);
  static const Color info = Color(0xFF3498DB);
  
  // Neutral Colors
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color grey50 = Color(0xFFFAFAFA);
  static const Color grey100 = Color(0xFFF5F5F5);
  static const Color grey200 = Color(0xFFEEEEEE);
  static const Color grey300 = Color(0xFFE0E0E0);
  static const Color grey400 = Color(0xFFBDBDBD);
  static const Color grey500 = Color(0xFF9E9E9E);
  static const Color grey600 = Color(0xFF757575);
  static const Color grey700 = Color(0xFF616161);
  static const Color grey800 = Color(0xFF424242);
  static const Color grey900 = Color(0xFF212121);
  
  // Background Colors
  static const Color background = Color(0xFFFAFAFA);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color surfaceVariant = Color(0xFFF5F5F5);
  
  // UMKM Brand Colors
  static const Color umkmPrimary = Color(0xFF2E7D8F);
  static const Color umkmSecondary = Color(0xFFF39C12);
  
  // Student Brand Colors  
  static const Color studentPrimary = Color(0xFF3498DB);
  static const Color studentSecondary = Color(0xFF9B59B6);
}

// Typography Scale
class AppTypography {
  // Headings
  static TextStyle get heading1 => GoogleFonts.inter(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    height: 1.2,
    letterSpacing: -0.5,
  );
  
  static TextStyle get heading2 => GoogleFonts.inter(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    height: 1.25,
    letterSpacing: -0.25,
  );
  
  static TextStyle get heading3 => GoogleFonts.inter(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    height: 1.3,
  );
  
  static TextStyle get heading4 => GoogleFonts.inter(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    height: 1.35,
  );
  
  static TextStyle get heading5 => GoogleFonts.inter(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    height: 1.4,
  );
  
  static TextStyle get heading6 => GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    height: 1.45,
  );
  
  // Body Text
  static TextStyle get bodyLarge => GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    height: 1.5,
  );
  
  static TextStyle get bodyMedium => GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    height: 1.45,
  );
  
  static TextStyle get bodySmall => GoogleFonts.inter(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    height: 1.4,
  );
  
  // Labels & Buttons
  static TextStyle get labelLarge => GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    height: 1.4,
  );
  
  static TextStyle get labelMedium => GoogleFonts.inter(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    height: 1.35,
  );
  
  static TextStyle get labelSmall => GoogleFonts.inter(
    fontSize: 11,
    fontWeight: FontWeight.w500,
    height: 1.3,
  );
  
  // Special Styles
  static TextStyle get caption => GoogleFonts.inter(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    height: 1.35,
    color: AppColors.grey600,
  );
  
  static TextStyle get overline => GoogleFonts.inter(
    fontSize: 10,
    fontWeight: FontWeight.w500,
    height: 1.6,
    letterSpacing: 1.5,
    color: AppColors.grey600,
  );
  
  // Button Styles
  static TextStyle get buttonLarge => GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    height: 1.25,
  );
  
  static TextStyle get buttonMedium => GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    height: 1.25,
  );
  
  static TextStyle get buttonSmall => GoogleFonts.inter(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    height: 1.25,
  );
}

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      
      // Color Scheme
      colorScheme: const ColorScheme.light(
        primary: AppColors.primary,
        secondary: AppColors.secondary,
        error: AppColors.error,
        background: AppColors.background,
        surface: AppColors.surface,
        surfaceVariant: AppColors.surfaceVariant,
      ),
      
      // Typography - Using Google Fonts
      textTheme: TextTheme(
        headlineLarge: AppTypography.heading1,
        headlineMedium: AppTypography.heading2,
        headlineSmall: AppTypography.heading3,
        titleLarge: AppTypography.heading4,
        titleMedium: AppTypography.heading5,
        titleSmall: AppTypography.heading6,
        bodyLarge: AppTypography.bodyLarge,
        bodyMedium: AppTypography.bodyMedium,
        bodySmall: AppTypography.bodySmall,
        labelLarge: AppTypography.labelLarge,
        labelMedium: AppTypography.labelMedium,
        labelSmall: AppTypography.labelSmall,
      ),
      
      // App Bar Theme
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.white,
        foregroundColor: AppColors.grey900,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: AppTypography.heading5.copyWith(
          color: AppColors.grey900,
        ),
        iconTheme: const IconThemeData(
          color: AppColors.grey700,
          size: 24,
        ),
      ),
      
      // Button Themes
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.white,
          elevation: 0,
          shadowColor: AppColors.primary.withOpacity(0.3),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle: AppTypography.buttonMedium,
        ),
      ),
      
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.primary,
          side: const BorderSide(color: AppColors.primary, width: 1.5),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle: AppTypography.buttonMedium,
        ),
      ),
      
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.primary,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          textStyle: AppTypography.buttonMedium,
        ),
      ),
      
      // Input Decoration Theme
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.grey300),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.grey300),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.primary, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.error),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.error, width: 2),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        hintStyle: AppTypography.bodyMedium.copyWith(
          color: AppColors.grey500,
        ),
        labelStyle: AppTypography.labelMedium.copyWith(
          color: AppColors.grey700,
        ),
        errorStyle: AppTypography.caption.copyWith(
          color: AppColors.error,
        ),
      ),
      
      // Card Theme
      cardTheme: CardTheme(
        elevation: 4,
        shadowColor: AppColors.black.withOpacity(0.1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        color: AppColors.white,
        surfaceTintColor: AppColors.white,
      ),
      
      // Chip Theme
      chipTheme: ChipThemeData(
        backgroundColor: AppColors.grey100,
        disabledColor: AppColors.grey200,
        selectedColor: AppColors.primary.withOpacity(0.1),
        secondarySelectedColor: AppColors.primary,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        labelStyle: AppTypography.labelMedium,
        secondaryLabelStyle: AppTypography.labelMedium.copyWith(
          color: AppColors.primary,
        ),
        brightness: Brightness.light,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      
      // Divider Theme
      dividerTheme: const DividerThemeData(
        color: AppColors.grey200,
        thickness: 1,
        space: 1,
      ),
      
      // Icon Theme
      iconTheme: const IconThemeData(
        color: AppColors.grey700,
        size: 24,
      ),
      
      // Bottom Navigation Bar Theme
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: AppColors.white,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.grey500,
        type: BottomNavigationBarType.fixed,
        elevation: 8,
        selectedLabelStyle: AppTypography.caption.copyWith(
          fontWeight: FontWeight.w600,
        ),
        unselectedLabelStyle: AppTypography.caption,
      ),
    );
  }
  
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: const ColorScheme.dark(
        primary: AppColors.primaryLight,
        secondary: AppColors.secondaryLight,
        error: AppColors.error,
      ),
      textTheme: GoogleFonts.interTextTheme(ThemeData.dark().textTheme),
    );
  }
}

// Helper Extensions
extension AppTextStyleExtensions on TextStyle {
  TextStyle get primary => copyWith(color: AppColors.primary);
  TextStyle get secondary => copyWith(color: AppColors.secondary);
  TextStyle get success => copyWith(color: AppColors.success);
  TextStyle get warning => copyWith(color: AppColors.warning);
  TextStyle get error => copyWith(color: AppColors.error);
  TextStyle get white => copyWith(color: AppColors.white);
  TextStyle get grey => copyWith(color: AppColors.grey600);
}