import 'package:flutter/material.dart';
import '../../../../../core/theme/app_colors.dart';

class HelpCenterScreen extends StatelessWidget {
  const HelpCenterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: AppBar(
        title: const Text('Help Center', style: TextStyle(color: AppColors.deepNavy, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: AppColors.deepNavy),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: const [
          ExpansionTile(
            title: Text('How do I upgrade my account?', style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.deepNavy)),
            children: [Padding(padding: EdgeInsets.all(8.0), child: Text('Go to your profile dashboard and tap on "Upgrade Account" to submit your KYC documents.'))],
          ),
          ExpansionTile(
            title: Text('How secure is my data?', style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.deepNavy)),
            children: [Padding(padding: EdgeInsets.all(8.0), child: Text('We use end-to-end encryption and secure security PINs to safeguard all user information.'))],
          ),
        ],
      ),
    );
  }
}