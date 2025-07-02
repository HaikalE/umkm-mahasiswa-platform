import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text(
          'Proyek & Pekerjaan',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: AppColors.white,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              // TODO: Add filter functionality
            },
            icon: const Icon(Icons.filter_list),
          ),
        ],
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.work_outline,
              size: 80,
              color: AppColors.grey400,
            ),
            SizedBox(height: 16),
            Text(
              'Proyek & Pekerjaan',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.grey700,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Fitur ini akan segera hadir!\nDi sini Anda bisa mencari dan mengelola\nproyek serta pekerjaan.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: AppColors.grey600,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: Add create project functionality
        },
        backgroundColor: AppColors.primary,
        child: const Icon(
          Icons.add,
          color: AppColors.white,
        ),
      ),
    );
  }
}