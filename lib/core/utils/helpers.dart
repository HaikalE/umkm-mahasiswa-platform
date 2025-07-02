import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../theme/app_theme.dart';

class Helpers {
  // Date & Time Formatting
  static String formatDate(DateTime date, {String pattern = 'dd MMM yyyy'}) {
    return DateFormat(pattern, 'id_ID').format(date);
  }
  
  static String formatDateTime(DateTime dateTime) {
    return DateFormat('dd MMM yyyy, HH:mm', 'id_ID').format(dateTime);
  }
  
  static String formatTime(DateTime time) {
    return DateFormat('HH:mm', 'id_ID').format(time);
  }
  
  static String timeAgo(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);
    
    if (difference.inDays > 0) {
      return '${difference.inDays}h lalu';
    } else if (difference.inHours > 0) {
      return '${difference.inHours}j lalu';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes}m lalu';
    } else {
      return 'Baru saja';
    }
  }
  
  // Currency Formatting
  static String formatCurrency(double amount, {String symbol = 'Rp '}) {
    final formatter = NumberFormat.currency(
      locale: 'id_ID',
      symbol: symbol,
      decimalDigits: 0,
    );
    return formatter.format(amount);
  }
  
  static String formatCompactCurrency(double amount) {
    if (amount >= 1000000000) {
      return 'Rp ${(amount / 1000000000).toStringAsFixed(1)}M';
    } else if (amount >= 1000000) {
      return 'Rp ${(amount / 1000000).toStringAsFixed(1)}jt';
    } else if (amount >= 1000) {
      return 'Rp ${(amount / 1000).toStringAsFixed(0)}rb';
    } else {
      return 'Rp ${amount.toStringAsFixed(0)}';
    }
  }
  
  // File Size Formatting
  static String formatFileSize(int bytes) {
    if (bytes >= 1073741824) {
      return '${(bytes / 1073741824).toStringAsFixed(1)} GB';
    } else if (bytes >= 1048576) {
      return '${(bytes / 1048576).toStringAsFixed(1)} MB';
    } else if (bytes >= 1024) {
      return '${(bytes / 1024).toStringAsFixed(1)} KB';
    } else {
      return '$bytes B';
    }
  }
  
  // Validation
  static bool isValidEmail(String email) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }
  
  static bool isValidPhone(String phone) {
    return RegExp(r'^[\+]?[0-9]{10,13}$').hasMatch(phone);
  }
  
  static bool isValidUrl(String url) {
    return RegExp(r'^https?://[\w\-]+(\.[\w\-]+)+([\w\-\.,@?^=%&:/~\+#]*[\w\-\@?^=%&/~\+#])?$')
        .hasMatch(url);
  }
  
  // String Utilities
  static String capitalize(String text) {
    if (text.isEmpty) return text;
    return text[0].toUpperCase() + text.substring(1).toLowerCase();
  }
  
  static String truncateText(String text, int maxLength) {
    if (text.length <= maxLength) return text;
    return '${text.substring(0, maxLength)}...';
  }
  
  static String removeHtmlTags(String html) {
    return html.replaceAll(RegExp(r'<[^>]*>'), '');
  }
  
  // UI Helpers
  static void showSnackBar(BuildContext context, String message, {
    bool isError = false,
    Duration duration = const Duration(seconds: 3),
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: isError ? AppColors.error : AppColors.success,
        duration: duration,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
  
  static Future<bool?> showConfirmDialog(BuildContext context, {
    required String title,
    required String content,
    String confirmText = 'Ya',
    String cancelText = 'Batal',
  }) {
    return showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text(cancelText),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: Text(
              confirmText,
              style: const TextStyle(color: AppColors.error),
            ),
          ),
        ],
      ),
    );
  }
  
  static void hideKeyboard(BuildContext context) {
    FocusScope.of(context).unfocus();
  }
  
  // Color Utilities
  static Color getRandomColor() {
    final colors = [
      AppColors.primary,
      AppColors.secondary,
      AppColors.success,
      AppColors.info,
      AppColors.warning,
    ];
    return colors[(DateTime.now().millisecondsSinceEpoch % colors.length)];
  }
  
  static Color getContrastColor(Color backgroundColor) {
    // Calculate relative luminance
    final luminance = backgroundColor.computeLuminance();
    return luminance > 0.5 ? AppColors.black : AppColors.white;
  }
  
  // Debug Utilities
  static void debugLog(String message, [String? tag]) {
    final timestamp = DateTime.now().toIso8601String();
    final logTag = tag != null ? '[$tag]' : '[DEBUG]';
    debugPrint('$timestamp $logTag $message');
  }
}