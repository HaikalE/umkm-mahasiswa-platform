import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';

class RecentActivities extends StatelessWidget {
  const RecentActivities({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section Header
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Aktivitas Terbaru',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.grey900,
            ),
          ),
        ),
        const SizedBox(height: 16),
        
        // Activity List
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          itemCount: 4, // Placeholder count
          itemBuilder: (context, index) {
            return _buildActivityItem(
              icon: _getActivityIcon(index),
              title: _getActivityTitle(index),
              subtitle: _getActivitySubtitle(index),
              time: _getActivityTime(index),
              color: _getActivityColor(index),
            );
          },
        ),
      ],
    );
  }

  Widget _buildActivityItem({
    required IconData icon,
    required String title,
    required String subtitle,
    required String time,
    required Color color,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.grey200),
      ),
      child: Row(
        children: [
          // Icon
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              icon,
              color: color,
              size: 20,
            ),
          ),
          const SizedBox(width: 12),
          
          // Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.grey900,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppColors.grey600,
                  ),
                ),
              ],
            ),
          ),
          
          // Time
          Text(
            time,
            style: const TextStyle(
              fontSize: 12,
              color: AppColors.grey500,
            ),
          ),
        ],
      ),
    );
  }

  IconData _getActivityIcon(int index) {
    switch (index % 4) {
      case 0:
        return Icons.visibility_outlined;
      case 1:
        return Icons.chat_bubble_outline;
      case 2:
        return Icons.favorite_outline;
      case 3:
        return Icons.work_outline;
      default:
        return Icons.notifications_outlined;
    }
  }

  String _getActivityTitle(int index) {
    switch (index % 4) {
      case 0:
        return 'Profil Anda dilihat';
      case 1:
        return 'Pesan baru masuk';
      case 2:
        return 'Produk disukai';
      case 3:
        return 'Aplikasi proyek';
      default:
        return 'Aktivitas baru';
    }
  }

  String _getActivitySubtitle(int index) {
    switch (index % 4) {
      case 0:
        return 'UMKM Warung Makan melihat profil Anda';
      case 1:
        return 'Dari Toko Baju Fashion';
      case 2:
        return 'Desain logo Anda mendapat 5 like';
      case 3:
        return 'Aplikasi diterima untuk proyek website';
      default:
        return 'Detail aktivitas';
    }
  }

  String _getActivityTime(int index) {
    switch (index % 4) {
      case 0:
        return '2j lalu';
      case 1:
        return '5j lalu';
      case 2:
        return '1h lalu';
      case 3:
        return '2h lalu';
      default:
        return 'Baru saja';
    }
  }

  Color _getActivityColor(int index) {
    switch (index % 4) {
      case 0:
        return AppColors.info;
      case 1:
        return AppColors.primary;
      case 2:
        return AppColors.error;
      case 3:
        return AppColors.success;
      default:
        return AppColors.grey500;
    }
  }
}