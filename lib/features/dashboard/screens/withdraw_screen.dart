import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

class WithdrawScreen extends StatefulWidget {
  const WithdrawScreen({super.key});

  @override
  State<WithdrawScreen> createState() => _WithdrawScreenState();
}

class _WithdrawScreenState extends State<WithdrawScreen> {
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  String _selectedProvider = 'MTN MoMo';

  @override
  void dispose() {
    _amountController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  void _showSuccessBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        padding: const EdgeInsets.all(24),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 6,
              width: 40,
              decoration: BoxDecoration(color: AppColors.borderLight, borderRadius: BorderRadius.circular(3)),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(color: Color(0xFFE8F5E9), shape: BoxShape.circle),
              child: const Icon(Icons.check_rounded, color: Color(0xFF2E7D32), size: 36),
            ),
            const SizedBox(height: 16),
            const Text('Withdrawal Successful!', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.deepNavy)),
            const SizedBox(height: 8),
            const Text(
              'Your withdrawal request has been processed successfully. Funds will reflect shortly.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 13, color: AppColors.textSecondary),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // Close bottom sheet
                  Navigator.pop(context); // Return to Dashboard
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.deepNavy,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: const Text('Back to Dashboard', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: AppBar(
        title: const Text('Withdraw Funds', style: TextStyle(color: AppColors.deepNavy, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: AppColors.deepNavy),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Available Balance Card
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF0F172A), Color(0xFF1E293B)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('AVAILABLE BALANCE', style: TextStyle(fontSize: 11, color: Colors.white70, letterSpacing: 1.2)),
                  SizedBox(height: 6),
                  Text('FCFA 1,450,000', style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.white)),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Provider Selection
            const Text('Select Provider', style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: AppColors.deepNavy)),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => setState(() => _selectedProvider = 'MTN MoMo'),
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: _selectedProvider == 'MTN MoMo' ? AppColors.primaryOrange : AppColors.borderLight.withValues(alpha: 0.6),
                          width: _selectedProvider == 'MTN MoMo' ? 2 : 1,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.phone_android_rounded, size: 18, color: Color(0xFFFFB703)),
                          SizedBox(width: 8),
                          Text('MTN MoMo', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: AppColors.deepNavy)),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: GestureDetector(
                    onTap: () => setState(() => _selectedProvider = 'Orange Money'),
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: _selectedProvider == 'Orange Money' ? AppColors.primaryOrange : AppColors.borderLight.withValues(alpha: 0.6),
                          width: _selectedProvider == 'Orange Money' ? 2 : 1,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.phone_android_rounded, size: 18, color: Color(0xFFE85D04)),
                          SizedBox(width: 8),
                          Text('Orange Money', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: AppColors.deepNavy)),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Withdraw Amount Input
            const Text('Withdrawable Amount (FCFA)', style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: AppColors.deepNavy)),
            const SizedBox(height: 8),
            TextField(
              controller: _amountController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'FCFA 0',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: AppColors.borderLight.withValues(alpha: 0.6))),
                enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: AppColors.borderLight.withValues(alpha: 0.6))),
              ),
            ),
            const SizedBox(height: 6),
            const Align(
              alignment: Alignment.centerRight,
              child: Text('Estimated Fee: - 500 FCFA', style: TextStyle(fontSize: 11, color: AppColors.primaryOrange, fontWeight: FontWeight.w600)),
            ),
            const SizedBox(height: 16),

            // Destination Mobile Number
            const Text('Destination Mobile Number', style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: AppColors.deepNavy)),
            const SizedBox(height: 8),
            TextField(
              controller: _phoneController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                hintText: '+237 6XX XXX XXX',
                prefixIcon: const Icon(Icons.phone_iphone_rounded, color: AppColors.textSecondary, size: 20),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.contacts_rounded, size: 18, color: AppColors.deepNavy),
                  onPressed: () {},
                ),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: AppColors.borderLight.withValues(alpha: 0.6))),
                enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: AppColors.borderLight.withValues(alpha: 0.6))),
              ),
            ),
            const SizedBox(height: 32),

            // Continue Button
            ElevatedButton(
              onPressed: () => _showSuccessBottomSheet(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.deepNavy,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              child: const Text('CONTINUE →', style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1.1)),
            ),
          ],
        ),
      ),
    );
  }
}