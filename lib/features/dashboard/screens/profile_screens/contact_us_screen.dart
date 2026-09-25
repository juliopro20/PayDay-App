import 'package:flutter/material.dart';
import '../../../../../core/theme/app_colors.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: AppBar(
        title: const Text('Contact Us', style: TextStyle(color: AppColors.deepNavy, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: AppColors.deepNavy),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: const [
            ListTile(
              leading: Icon(Icons.email, color: AppColors.primaryOrange),
              title: Text('Email Support'),
              subtitle: Text('support@payday.app'),
            ),
            ListTile(
              leading: Icon(Icons.phone, color: AppColors.primaryOrange),
              title: Text('Phone Hotline'),
              subtitle: Text('+237 233 000 000'),
            ),
          ],
        ),
      ),
    );
  }
}