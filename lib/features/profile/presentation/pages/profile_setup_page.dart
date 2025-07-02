import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/router/app_router.dart';
import '../../../../core/storage/local_storage.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../injection_container.dart' as di;
import '../widgets/student_profile_form.dart';
import '../widgets/umkm_profile_form.dart';

class ProfileSetupPage extends StatefulWidget {
  final String userType;

  const ProfileSetupPage({
    super.key,
    required this.userType,
  });

  @override
  State<ProfileSetupPage> createState() => _ProfileSetupPageState();
}

class _ProfileSetupPageState extends State<ProfileSetupPage> {
  final PageController _pageController = PageController();
  int _currentStep = 0;
  final int _totalSteps = 3;
  bool _isLoading = false;

  Future<void> _handleComplete() async {
    setState(() {
      _isLoading = true;
    });

    try {
      // TODO: Save profile data to backend
      await Future.delayed(const Duration(seconds: 2)); // Simulate API call
      
      final localStorage = di.sl<LocalStorage>();
      await localStorage.setBool(StorageKeys.profileSetupCompleted, true);
      await localStorage.setString(StorageKeys.userType, widget.userType);
      
      if (mounted) {
        context.go(AppRouter.home);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Setup profil gagal: ${e.toString()}'),
            backgroundColor: AppColors.error,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  void _nextStep() {
    if (_currentStep < _totalSteps - 1) {
      setState(() {
        _currentStep++;
      });
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      _handleComplete();
    }
  }

  void _previousStep() {
    if (_currentStep > 0) {
      setState(() {
        _currentStep--;
      });
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: _currentStep > 0
            ? IconButton(
                onPressed: _previousStep,
                icon: const Icon(Icons.arrow_back_ios),
              )
            : null,
        title: Text(
          widget.userType == 'student' ? 'Setup Profil Mahasiswa' : 'Setup Profil UMKM',
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Progress Indicator
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Column(
              children: [
                Row(
                  children: List.generate(_totalSteps, (index) {
                    return Expanded(
                      child: Container(
                        margin: EdgeInsets.only(
                          right: index < _totalSteps - 1 ? 8 : 0,
                        ),
                        height: 4,
                        decoration: BoxDecoration(
                          color: index <= _currentStep
                              ? AppColors.primary
                              : AppColors.grey300,
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                    );
                  }),
                ),
                const SizedBox(height: 8),
                Text(
                  'Langkah ${_currentStep + 1} dari $_totalSteps',
                  style: const TextStyle(
                    fontSize: 14,
                    color: AppColors.grey600,
                  ),
                ),
              ],
            ),
          ),
          
          // Form Content
          Expanded(
            child: PageView(
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(),
              children: widget.userType == 'student'
                  ? [
                      StudentProfileForm(
                        step: 1,
                        onNext: _nextStep,
                      ),
                      StudentProfileForm(
                        step: 2,
                        onNext: _nextStep,
                      ),
                      StudentProfileForm(
                        step: 3,
                        onNext: _nextStep,
                        isLoading: _isLoading,
                      ),
                    ]
                  : [
                      UMKMProfileForm(
                        step: 1,
                        onNext: _nextStep,
                      ),
                      UMKMProfileForm(
                        step: 2,
                        onNext: _nextStep,
                      ),
                      UMKMProfileForm(
                        step: 3,
                        onNext: _nextStep,
                        isLoading: _isLoading,
                      ),
                    ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}