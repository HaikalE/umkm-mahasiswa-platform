import 'package:dio/dio.dart';

// NOTE: Retrofit API client disabled temporarily due to code generation issues
// TODO: Implement proper API client later

abstract class ApiClient {
  // Placeholder methods - will implement with proper API integration later
  
  static Future<Map<String, dynamic>> login(Map<String, dynamic> credentials) async {
    // TODO: Implement actual API call
    await Future.delayed(Duration(seconds: 1)); // Simulate API delay
    return {'success': true, 'message': 'Login placeholder'};
  }
  
  static Future<Map<String, dynamic>> register(Map<String, dynamic> userData) async {
    // TODO: Implement actual API call
    await Future.delayed(Duration(seconds: 1));
    return {'success': true, 'message': 'Register placeholder'};
  }
  
  static Future<void> logout() async {
    // TODO: Implement actual API call
    await Future.delayed(Duration(seconds: 1));
  }
  
  static Future<Map<String, dynamic>> getCurrentUser() async {
    // TODO: Implement actual API call
    await Future.delayed(Duration(seconds: 1));
    return {'id': '1', 'name': 'Test User', 'email': 'test@example.com'};
  }
  
  static Future<List<Map<String, dynamic>>> getUMKMProfiles({
    int page = 1,
    int limit = 10,
    String? category,
    String? location,
  }) async {
    // TODO: Implement actual API call
    await Future.delayed(Duration(seconds: 1));
    return [
      {'id': '1', 'name': 'Sample UMKM', 'category': 'Food'},
      {'id': '2', 'name': 'Another UMKM', 'category': 'Craft'},
    ];
  }
  
  // Add more placeholder methods as needed...
  
  static Future<Response<dynamic>> uploadFile(FormData formData) async {
    // TODO: Implement actual file upload
    await Future.delayed(Duration(seconds: 2));
    return Response(
      data: {'success': true, 'url': 'https://example.com/file.jpg'},
      statusCode: 200,
      requestOptions: RequestOptions(path: '/upload'),
    );
  }
}