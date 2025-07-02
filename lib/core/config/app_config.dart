class AppConfig {
  static const String appName = 'UMKM x Mahasiswa';
  static const String appVersion = '1.0.0';
  static const String apiBaseUrl = 'https://api.umkm-mahasiswa.id';
  
  // Database
  static const String dbHost = 'localhost';
  static const int dbPort = 5432;
  static const String dbName = 'umkm_mahasiswa_db';
  
  // Firebase
  static const String firebaseProjectId = 'umkm-mahasiswa-platform';
  
  // Storage
  static const String cloudinaryCloudName = 'umkm-mahasiswa';
  static const String cloudinaryApiKey = 'your-api-key';
  
  // Features
  static const bool enableAnalytics = true;
  static const bool enableCrashlytics = true;
  static const int maxImageSizeMB = 5;
  static const int chatMessageLimit = 100;
  
  // Business Logic
  static const double platformCommissionRate = 0.05; // 5%
  static const int projectDeadlineMinDays = 1;
  static const int maxPortfolioItems = 10;
}