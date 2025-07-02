class AppConstants {
  // API Endpoints
  static const String baseUrl = 'https://api.umkm-mahasiswa.id/v1';
  static const String authEndpoint = '/auth';
  static const String umkmEndpoint = '/umkm';
  static const String studentEndpoint = '/students';
  static const String productEndpoint = '/products';
  static const String projectEndpoint = '/projects';
  static const String chatEndpoint = '/chat';
  static const String uploadEndpoint = '/upload';
  
  // Storage Keys
  static const String accessTokenKey = 'access_token';
  static const String refreshTokenKey = 'refresh_token';
  static const String userIdKey = 'user_id';
  static const String userTypeKey = 'user_type';
  static const String profileDataKey = 'profile_data';
  
  // App Settings
  static const int connectionTimeout = 30000; // 30 seconds
  static const int receiveTimeout = 30000; // 30 seconds
  static const int maxRetries = 3;
  static const int pageSize = 20;
  
  // File Upload
  static const int maxFileSize = 5 * 1024 * 1024; // 5MB
  static const List<String> allowedImageTypes = ['jpg', 'jpeg', 'png', 'webp'];
  static const List<String> allowedDocTypes = ['pdf', 'doc', 'docx'];
  
  // Validation
  static const int minPasswordLength = 6;
  static const int maxBioLength = 500;
  static const int minBioLength = 50;
  static const int maxBusinessNameLength = 100;
  static const int maxProductNameLength = 100;
  
  // User Types
  static const String userTypeStudent = 'student';
  static const String userTypeUMKM = 'umkm';
  
  // Project Types
  static const String projectTypeFreelance = 'freelance';
  static const String projectTypeInternship = 'internship';
  static const String projectTypePartTime = 'part_time';
  static const String projectTypeFullTime = 'full_time';
  static const String projectTypeCompetition = 'competition';
  
  // Application Status
  static const String applicationStatusPending = 'pending';
  static const String applicationStatusAccepted = 'accepted';
  static const String applicationStatusRejected = 'rejected';
  static const String applicationStatusWithdrawn = 'withdrawn';
  
  // Message Types
  static const String messageTypeText = 'text';
  static const String messageTypeImage = 'image';
  static const String messageTypeFile = 'file';
  static const String messageTypeSystem = 'system';
  
  // Error Messages
  static const String networkErrorMessage = 'Koneksi internet bermasalah';
  static const String serverErrorMessage = 'Terjadi kesalahan pada server';
  static const String unknownErrorMessage = 'Terjadi kesalahan yang tidak diketahui';
  static const String noDataMessage = 'Tidak ada data';
  
  // Success Messages
  static const String loginSuccessMessage = 'Login berhasil';
  static const String registerSuccessMessage = 'Registrasi berhasil';
  static const String profileUpdateSuccessMessage = 'Profil berhasil diperbarui';
  static const String applicationSentMessage = 'Lamaran berhasil dikirim';
}