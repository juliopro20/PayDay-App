import 'package:flutter/material.dart';
import '../../../../../core/theme/app_colors.dart';

class PersonalInformationScreen extends StatelessWidget {
  const PersonalInformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: AppBar(
        title: const Text('Personal Information', style: TextStyle(color: AppColors.deepNavy, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: AppColors.deepNavy),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          _buildInfoField('Full Name', 'John Doe'),
          _buildInfoField('Email Address', 'john.doe@example.com'),
          _buildInfoField('Phone Number', '+237 671 234 567'),
          _buildInfoField('Date of Birth', '12 July 1995'),
          _buildInfoField('Residential Address', 'Bonaberi, Douala, Cameroon'),
        ],
      ),
    );
  }

  Widget _buildInfoField(String label, String value) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.borderLight.withOpacity(0.6)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(fontSize: 12, color: AppColors.textSecondary, fontWeight: FontWeight.w600)),
          const SizedBox(height: 4),
          Text(value, style: const TextStyle(fontSize: 15, color: AppColors.deepNavy, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}