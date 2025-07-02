import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/config/app_config.dart';
import 'core/network/api_client.dart';
import 'core/storage/local_storage.dart';

// Features will be added here as we develop them
// import 'features/auth/data/datasources/auth_remote_datasource.dart';
// import 'features/auth/data/repositories/auth_repository_impl.dart';
// import 'features/auth/domain/repositories/auth_repository.dart';
// import 'features/auth/domain/usecases/login_usecase.dart';
// import 'features/auth/domain/usecases/register_usecase.dart';
// import 'features/auth/domain/usecases/logout_usecase.dart';
// import 'features/auth/presentation/bloc/auth_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Core
  await _initCore();
  
  // Features will be initialized here
  // await _initAuth();
  // await _initUMKM();
  // await _initStudent();
  // await _initChat();
}

Future<void> _initCore() async {
  // External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  
  // Dio with interceptors
  final dio = Dio();
  dio.options.baseUrl = AppConfig.apiBaseUrl;
  dio.options.connectTimeout = const Duration(seconds: 30);
  dio.options.receiveTimeout = const Duration(seconds: 30);
  
  // Add interceptors
  dio.interceptors.add(
    InterceptorsWrapper(
      onRequest: (options, handler) {
        // Add auth token if available
        final token = sl<SharedPreferences>().getString('access_token');
        if (token != null) {
          options.headers['Authorization'] = 'Bearer $token';
        }
        handler.next(options);
      },
      onError: (error, handler) {
        // Handle 401 unauthorized
        if (error.response?.statusCode == 401) {
          // Clear stored tokens and redirect to login
          sl<SharedPreferences>().remove('access_token');
          sl<SharedPreferences>().remove('refresh_token');
        }
        handler.next(error);
      },
    ),
  );
  
  sl.registerLazySingleton(() => dio);
  
  // API Client
  sl.registerLazySingleton<ApiClient>(
    () => ApiClient(sl()),
  );
  
  // Local Storage
  sl.registerLazySingleton<LocalStorage>(
    () => LocalStorageImpl(sl()),
  );
}

// Future implementations for features
// Future<void> _initAuth() async {
//   // Will be implemented when we create auth feature
// }
// 
// Future<void> _initUMKM() async {
//   // Will be implemented when we create UMKM feature
// }
// 
// Future<void> _initStudent() async {
//   // Will be implemented when we create student feature
// }
// 
// Future<void> _initChat() async {
//   // Will be implemented when we create chat feature
// }