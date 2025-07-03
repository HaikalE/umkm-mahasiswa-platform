import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import '../../../../core/config/app_config.dart';
import '../../../../core/router/app_router.dart';
import '../../../../core/storage/local_storage.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../injection_container.dart' as di;

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _initAnimations();
    _testFirebaseConnection();
    _navigateToNext();
  }

  void _initAnimations() {
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: const Interval(0.0, 0.6, curve: Curves.easeIn),
    ));

    _scaleAnimation = Tween<double>(
      begin: 0.8,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: const Interval(0.2, 0.8, curve: Curves.elasticOut),
    ));

    _animationController.forward();
  }

  // Test Firebase connection with comprehensive error handling
  Future<void> _testFirebaseConnection() async {
    try {
      // Check if Firebase is initialized
      if (Firebase.apps.isEmpty) {
        print('❌ Firebase not initialized - skipping tests');
        return;
      }

      print('🔥 Testing Firebase connection...');
      
      // Test Firestore connection
      await FirebaseFirestore.instance
          .collection('test')
          .doc('connection-test')
          .set({
        'message': 'Firebase connected successfully!',
        'timestamp': FieldValue.serverTimestamp(),
        'app_version': '1.0.0',
        'test_time': DateTime.now().toIso8601String(),
      });
      
      print('✅ Firestore connection successful!');
      
      // Test Firebase Auth instance
      final auth = FirebaseAuth.instance;
      print('✅ Firebase Auth ready: ${auth.app.name}');
      
    } catch (e) {
      print('❌ Firebase connection failed: $e');
      print('🔄 App will continue without Firebase features');
    }
  }

  Future<void> _navigateToNext() async {
    await Future.delayed(const Duration(milliseconds: 3000));
    
    if (!mounted) return;

    try {
      // Try to get localStorage from dependency injection
      final localStorage = di.sl<LocalStorage>();
      
      // Check if user has completed onboarding
      final hasCompletedOnboarding = await localStorage.getBool(
        StorageKeys.onboardingCompleted,
      ) ?? false;
      
      // Check if user is logged in (fallback to local storage for now)
      final accessToken = await localStorage.getString(StorageKeys.accessToken);
      final isLoggedIn = accessToken != null && accessToken.isNotEmpty;

      if (!hasCompletedOnboarding) {
        if (mounted) context.go(AppRouter.onboarding);
      } else if (!isLoggedIn) {
        if (mounted) context.go(AppRouter.login);
      } else {
        // Check if profile setup is completed
        final hasCompletedProfileSetup = await localStorage.getBool(
          StorageKeys.profileSetupCompleted,
        ) ?? false;
        
        if (!hasCompletedProfileSetup) {
          final userType = await localStorage.getString(StorageKeys.userType) ?? 'student';
          if (mounted) context.go('${AppRouter.profileSetup}?type=$userType');
        } else {
          if (mounted) context.go(AppRouter.home);
        }
      }
    } catch (e) {
      // If dependency injection fails, go to onboarding as fallback
      debugPrint('Error during navigation: $e');
      if (mounted) context.go(AppRouter.onboarding);
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  AppColors.primary,
                  AppColors.primaryDark,
                ],
              ),
            ),
            child: Center(
              child: FadeTransition(
                opacity: _fadeAnimation,
                child: ScaleTransition(
                  scale: _scaleAnimation,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // App Logo
                      Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.black.withOpacity(0.2),
                              blurRadius: 20,
                              offset: const Offset(0, 10),
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons.handshake_rounded,
                          size: 60,
                          color: AppColors.primary,
                        ),
                      ),
                      const SizedBox(height: 32),
                      
                      // App Name
                      const Text(
                        AppConfig.appName,
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: AppColors.white,
                          letterSpacing: 1.2,
                        ),
                      ),
                      const SizedBox(height: 8),
                      
                      // Tagline
                      const Text(
                        'Menghubungkan UMKM & Mahasiswa',
                        style: TextStyle(
                          fontSize: 16,
                          color: AppColors.white,
                          fontWeight: FontWeight.w300,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 60),
                      
                      // Loading Indicator
                      const SizedBox(
                        width: 40,
                        height: 40,
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                            AppColors.white,
                          ),
                          strokeWidth: 3,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}