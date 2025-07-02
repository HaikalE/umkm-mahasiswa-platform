import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';
import '../widgets/home_header.dart';
import '../widgets/quick_stats_card.dart';
import '../widgets/featured_section.dart';
import '../widgets/recent_activities.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            // TODO: Implement refresh logic
            await Future.delayed(const Duration(seconds: 1));
          },
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              children: [
                // Header with greeting and notifications
                const HomeHeader(),
                
                // Quick Stats Cards
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: QuickStatsCard(),
                ),
                const SizedBox(height: 24),
                
                // Featured Section (Products/Projects)
                const FeaturedSection(),
                const SizedBox(height: 24),
                
                // Recent Activities
                const RecentActivities(),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}