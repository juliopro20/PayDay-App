import 'package:flutter/material.dart';
import '../../../../../core/theme/app_colors.dart';

class ChangeSecurityPinScreen extends StatelessWidget {
  const ChangeSecurityPinScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: AppBar(
        title: const Text('Change Security PIN', style: TextStyle(color: AppColors.deepNavy, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: AppColors.deepNavy),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const TextField(
              obscureText: true,
              maxLength: 4,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Current PIN', border: OutlineInputBorder()),
            ),
            const SizedBox(height: 16),
            const TextField(
              obscureText: true,
              maxLength: 4,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'New PIN', border: OutlineInputBorder()),
            ),
            const SizedBox(height: 16),
            const TextField(
              obscureText: true,
              maxLength: 4,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Confirm New PIN', border: OutlineInputBorder()),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryOrange,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: const Text('Update PIN'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}