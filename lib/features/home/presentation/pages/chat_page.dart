import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text(
          'Pesan',
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
              // TODO: Add search conversations
            },
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.chat_bubble_outline,
              size: 80,
              color: AppColors.grey400,
            ),
            SizedBox(height: 16),
            Text(
              'Belum Ada Pesan',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.grey700,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Mulai obrolan dengan UMKM\natau mahasiswa lainnya',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: AppColors.grey600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}