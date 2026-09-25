import 'package:flutter/material.dart';
import '../../../../../core/theme/app_colors.dart';

class TwoFactorAuthScreen extends StatefulWidget {
  const TwoFactorAuthScreen({super.key});

  @override
  State<TwoFactorAuthScreen> createState() => _TwoFactorAuthScreenState();
}

class _TwoFactorAuthScreenState extends State<TwoFactorAuthScreen> {
  bool _is2faEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: AppBar(
        title: const Text('Two-Factor Authentication', style: TextStyle(color: AppColors.deepNavy, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: AppColors.deepNavy),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            SwitchListTile(
              title: const Text('Enable 2FA via SMS', style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.deepNavy)),
              subtitle: const Text('Receive a verification code via SMS every time you log in.'),
              value: _is2faEnabled,
              activeColor: AppColors.primaryOrange,
              onChanged: (val) => setState(() => _is2faEnabled = val),
            ),
          ],
        ),
      ),
    );
  }
}