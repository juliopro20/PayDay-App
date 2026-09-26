import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

class VerifyAccountStep2Screen extends StatefulWidget {
  const VerifyAccountStep2Screen({super.key});

  @override
  State<VerifyAccountStep2Screen> createState() => _VerifyAccountStep2ScreenState();
}

class _VerifyAccountStep2ScreenState extends State<VerifyAccountStep2Screen> {
  bool _selfieUploaded = false;

  void _simulateSelfieCapture() {
    setState(() => _selfieUploaded = true);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Selfie captured successfully!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.deepNavy),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Verify Identity', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.deepNavy)),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Step Indicator Row
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Container(
                        height: 28,
                        width: 28,
                        decoration: const BoxDecoration(color: Color(0xFF10B981), shape: BoxShape.circle),
                        child: const Center(child: Icon(Icons.check, size: 16, color: Colors.white)),
                      ),
                      const SizedBox(height: 4),
                      const Text('Document', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Color(0xFF10B981))),
                    ],
                  ),
                  Container(height: 2, width: 120, color: const Color(0xFF10B981)),
                  Column(
                    children: [
                      Container(
                        height: 28,
                        width: 28,
                        decoration: const BoxDecoration(color: AppColors.deepNavy, shape: BoxShape.circle),
                        child: const Center(child: Text('2', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12))),
                      ),
                      const SizedBox(height: 4),
                      const Text('Selfie', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: AppColors.deepNavy)),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),

              const Text(
                'Please upload a clear image of your official government ID to comply with financial regulations.',
                style: TextStyle(fontSize: 12, color: AppColors.textSecondary, height: 1.4),
              ),
              const SizedBox(height: 20),

              // Dropdown Field / Label
              const Text('An image of yourself', style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: AppColors.deepNavy)),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.borderLight.withValues(alpha: 0.8)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text('Selfie', style: TextStyle(fontSize: 13, color: AppColors.deepNavy)),
                    Icon(Icons.keyboard_arrow_down_rounded, size: 20, color: AppColors.textSecondary),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Upload Selfie Box
              GestureDetector(
                onTap: _simulateSelfieCapture,
                child: Container(
                  height: 130,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: _selfieUploaded ? const Color(0xFF10B981) : AppColors.borderLight,
                      width: _selfieUploaded ? 1.5 : 1,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: _selfieUploaded ? const Color(0xFFE8F5E9) : AppColors.primaryOrange.withValues(alpha: 0.1),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(_selfieUploaded ? Icons.check_rounded : Icons.camera_alt_outlined, color: _selfieUploaded ? const Color(0xFF10B981) : AppColors.primaryOrange, size: 20),
                      ),
                      const SizedBox(height: 8),
                      Text(_selfieUploaded ? 'Selfie Captured Successfully' : 'Upload Front', style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: _selfieUploaded ? const Color(0xFF10B981) : AppColors.deepNavy)),
                      const SizedBox(height: 2),
                      const Text('Tap to capture or upload', style: TextStyle(fontSize: 11, color: AppColors.textSecondary)),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Encrypted Notice Card
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: AppColors.deepNavy.withValues(alpha: 0.03),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.deepNavy.withValues(alpha: 0.08)),
                ),
                child: Row(
                  children: const [
                    Icon(Icons.lock_rounded, size: 16, color: AppColors.deepNavy),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        'Your data is encrypted and securely stored. It will only be used for identity verification purposes.',
                        style: TextStyle(fontSize: 11, color: AppColors.textSecondary, height: 1.3),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Back to Profile Button
              ElevatedButton(
                onPressed: () {
                  // Pop back through verification steps straight to Dashboard/Profile
                  Navigator.popUntil(context, (route) => route.isFirst);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.deepNavy,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text('Back to Profile', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                    SizedBox(width: 8),
                    Icon(Icons.arrow_forward_rounded, size: 16),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}