import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';

class UserTypeSelector extends StatelessWidget {
  final String selectedType;
  final Function(String) onTypeChanged;

  const UserTypeSelector({
    super.key,
    required this.selectedType,
    required this.onTypeChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Saya adalah:',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: AppColors.grey900,
          ),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: _UserTypeCard(
                type: 'student',
                title: 'Mahasiswa',
                description: 'Cari pengalaman kerja & bangun portofolio',
                icon: Icons.school_outlined,
                isSelected: selectedType == 'student',
                onTap: () => onTypeChanged('student'),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _UserTypeCard(
                type: 'umkm',
                title: 'UMKM',
                description: 'Digitalisasi bisnis & cari talenta',
                icon: Icons.store_outlined,
                isSelected: selectedType == 'umkm',
                onTap: () => onTypeChanged('umkm'),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _UserTypeCard extends StatelessWidget {
  final String type;
  final String title;
  final String description;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  const _UserTypeCard({
    required this.type,
    required this.title,
    required this.description,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary.withOpacity(0.1) : AppColors.white,
          border: Border.all(
            color: isSelected ? AppColors.primary : AppColors.grey300,
            width: isSelected ? 2 : 1,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: isSelected
                    ? AppColors.primary.withOpacity(0.1)
                    : AppColors.grey100,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                icon,
                size: 24,
                color: isSelected ? AppColors.primary : AppColors.grey600,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: isSelected ? AppColors.primary : AppColors.grey900,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              description,
              style: const TextStyle(
                fontSize: 12,
                color: AppColors.grey600,
              ),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}