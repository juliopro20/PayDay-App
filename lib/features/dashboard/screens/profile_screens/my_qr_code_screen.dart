import 'package:flutter/material.dart';
import '../../../../../core/theme/app_colors.dart';

class MyQrCodeScreen extends StatelessWidget {
  const MyQrCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: AppBar(
        title: const Text('My QR Code', style: TextStyle(color: AppColors.deepNavy, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: AppColors.deepNavy),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(24),
          margin: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: AppColors.borderLight.withOpacity(0.6)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage('https://images.unsplash.com/photo-1534528741775-53994a69daeb?w=150'),
              ),
              const SizedBox(height: 12),
              const Text('John Doe', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.deepNavy)),
              const Text('+237 671 234 567', style: TextStyle(color: AppColors.textSecondary)),
              const SizedBox(height: 24),
              Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  color: AppColors.backgroundLight,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.borderLight),
                ),
                child: const Center(
                  child: Icon(Icons.qr_code_2_rounded, size: 140, color: AppColors.deepNavy),
                ),
              ),
              const SizedBox(height: 24),
              const Text('Scan this code to send money instantly to John Doe', textAlign: TextAlign.center, style: TextStyle(fontSize: 12, color: AppColors.textSecondary)),
            ],
          ),
        ),
      ),
    );
  }
}