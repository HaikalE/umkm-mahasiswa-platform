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
  late Animation<double> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _initAnimations();
    _testFirebaseConnection();
    _navigateToNext();
  }

  void _initAnimations() {
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 2500),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: const Interval(0.0, 0.6, curve: Curves.easeInOut),
    ));

    _scaleAnimation = Tween<double>(
      begin: 0.7,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: const Interval(0.2, 0.8, curve: Curves.elasticOut),
    ));

    _slideAnimation = Tween<double>(
      begin: 30.0,
      end: 0.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: const Interval(0.4, 1.0, curve: Curves.easeOutCubic),
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
    await Future.delayed(const Duration(milliseconds: 3500));
    
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
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  AppColors.primary,
                  AppColors.primaryDark,
                  AppColors.primaryDark.withOpacity(0.9),
                ],
                stops: const [0.0, 0.7, 1.0],
              ),
            ),
            child: Center(
              child: FadeTransition(
                opacity: _fadeAnimation,
                child: Transform.translate(
                  offset: Offset(0, _slideAnimation.value),
                  child: ScaleTransition(
                    scale: _scaleAnimation,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // App Logo with improved styling
                        Container(
                          width: 140,
                          height: 140,
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(35),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.black.withOpacity(0.25),
                                blurRadius: 30,
                                offset: const Offset(0, 15),
                                spreadRadius: 0,
                              ),
                              BoxShadow(
                                color: AppColors.primaryDark.withOpacity(0.4),
                                blurRadius: 20,
                                offset: const Offset(0, 5),
                                spreadRadius: -5,
                              ),
                            ],
                          ),
                          child: const Icon(
                            Icons.handshake_rounded,
                            size: 70,
                            color: AppColors.primary,
                          ),
                        ),
                        const SizedBox(height: 48),
                        
                        // App Name with new typography
                        Text(
                          AppConfig.appName,
                          style: AppTypography.heading1.copyWith(
                            color: AppColors.white,
                            fontSize: 36,
                            fontWeight: FontWeight.w800,
                            letterSpacing: -0.5,
                            shadows: [
                              Shadow(
                                color: AppColors.black.withOpacity(0.3),
                                offset: const Offset(0, 2),
                                blurRadius: 8,
                              ),
                            ],
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 16),
                        
                        // Tagline with improved typography
                        Text(
                          'Menghubungkan UMKM & Mahasiswa',
                          style: AppTypography.bodyLarge.copyWith(
                            color: AppColors.white.withOpacity(0.9),
                            fontSize: 17,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0.3,
                            height: 1.4,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 8),
                        
                        // Subtitle
                        Text(
                          'Platform Digitalisasi Indonesia',
                          style: AppTypography.bodyMedium.copyWith(
                            color: AppColors.white.withOpacity(0.7),
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                            letterSpacing: 0.5,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 80),
                        
                        // Modern Loading Indicator
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: AppColors.white.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(12),
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                AppColors.white,
                              ),
                              strokeWidth: 3,
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
                        
                        // Loading text
                        Text(
                          'Mempersiapkan aplikasi...',
                          style: AppTypography.labelMedium.copyWith(
                            color: AppColors.white.withOpacity(0.8),
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0.3,
                          ),
                        ),
                      ],
                    ),
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