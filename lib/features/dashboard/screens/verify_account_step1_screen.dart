import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import 'verify_account_step2_screen.dart';

class VerifyAccountStep1Screen extends StatefulWidget {
  const VerifyAccountStep1Screen({super.key});

  @override
  State<VerifyAccountStep1Screen> createState() => _VerifyAccountStep1ScreenState();
}

class _VerifyAccountStep1ScreenState extends State<VerifyAccountStep1Screen> {
  String _selectedDocumentType = 'National ID Card';
  bool _frontUploaded = false;
  bool _backUploaded = false;

  void _simulateUpload(bool isFront) {
    setState(() {
      if (isFront) {
        _frontUploaded = true;
      } else {
        _backUploaded = true;
      }
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(isFront ? 'Front document uploaded successfully!' : 'Back document uploaded successfully!')),
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
                        decoration: const BoxDecoration(color: AppColors.deepNavy, shape: BoxShape.circle),
                        child: const Center(child: Text('1', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12))),
                      ),
                      const SizedBox(height: 4),
                      const Text('Document', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: AppColors.deepNavy)),
                    ],
                  ),
                  Container(height: 2, width: 120, color: AppColors.borderLight),
                  Column(
                    children: [
                      Container(
                        height: 28,
                        width: 28,
                        decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle, border: Border.all(color: AppColors.borderLight)),
                        child: const Center(child: Text('2', style: TextStyle(color: AppColors.textSecondary, fontWeight: FontWeight.bold, fontSize: 12))),
                      ),
                      const SizedBox(height: 4),
                      const Text('Selfie', style: TextStyle(fontSize: 11, color: AppColors.textSecondary)),
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

              // Dropdown Selector
              const Text('Document Type', style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: AppColors.deepNavy)),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.borderLight.withOpacity(0.8)),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: _selectedDocumentType,
                    isExpanded: true,
                    items: ['National ID Card', 'Passport', "Driver's License"].map((type) {
                      return DropdownMenuItem(value: type, child: Text(type, style: const TextStyle(fontSize: 13, color: AppColors.deepNavy)));
                    }).toList(),
                    onChanged: (val) => setState(() => _selectedDocumentType = val!),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Upload Front Box
              _buildUploadBox('Upload Front', 'Tap to capture or upload', Icons.camera_alt_outlined, _frontUploaded, () => _simulateUpload(true)),
              const SizedBox(height: 16),

              // Upload Back Box
              _buildUploadBox('Upload Back', 'Tap to capture or upload', Icons.file_copy_outlined, _backUploaded, () => _simulateUpload(false)),
              const SizedBox(height: 20),

              // Encrypted Notice Card
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: AppColors.deepNavy.withOpacity(0.03),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.deepNavy.withOpacity(0.08)),
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

              // Continue Button
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const VerifyAccountStep2Screen()),
                  );
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
                    Text('Continue to Next Step', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
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

  Widget _buildUploadBox(String title, String subtitle, IconData icon, bool isUploaded, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 110,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isUploaded ? const Color(0xFF10B981) : AppColors.borderLight,
            style: BorderStyle.solid,
            width: isUploaded ? 1.5 : 1,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: isUploaded ? const Color(0xFFE8F5E9) : AppColors.primaryOrange.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(isUploaded ? Icons.check_rounded : icon, color: isUploaded ? const Color(0xFF10B981) : AppColors.primaryOrange, size: 20),
            ),
            const SizedBox(height: 8),
            Text(isUploaded ? '$title (Uploaded)' : title, style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: isUploaded ? const Color(0xFF10B981) : AppColors.deepNavy)),
            const SizedBox(height: 2),
            Text(isUploaded ? 'Tap to change file' : subtitle, style: const TextStyle(fontSize: 11, color: AppColors.textSecondary)),
          ],
        ),
      ),
    );
  }
}