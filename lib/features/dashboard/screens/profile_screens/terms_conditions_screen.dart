import 'package:flutter/material.dart';
import '../../../../../core/theme/app_colors.dart';

class TermsConditionsScreen extends StatelessWidget {
  const TermsConditionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: AppBar(
        title: const Text('Terms & Conditions', style: TextStyle(color: AppColors.deepNavy, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: AppColors.deepNavy),
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Text(
          'Welcome to PayDay. By using our mobile application, you agree to comply with and be bound by the following terms and conditions of use. Please read them carefully...',
          style: TextStyle(color: AppColors.textSecondary, height: 1.5),
        ),
      ),
    );
  }
}