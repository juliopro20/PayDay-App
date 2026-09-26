import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_colors.dart';

class PinSetupScreen extends StatefulWidget {
  const PinSetupScreen({super.key});

  @override
  State<PinSetupScreen> createState() => _PinSetupScreenState();
}

class _PinSetupScreenState extends State<PinSetupScreen> {
  String _pin = '';

  void _onKeyPressed(String value) {
    setState(() {
      if (value == 'backspace') {
        if (_pin.isNotEmpty) {
          _pin = _pin.substring(0, _pin.length - 1);
        }
      } else {
        if (_pin.length < 4) {
          _pin += value;
          if (_pin.length == 4) {
            // Automatically navigate to success screen when 4 digits are entered
            Future.delayed(const Duration(milliseconds: 300), () {
              if (mounted) context.go('/account-success');
            });
          }
        }
      }
    });
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
          onPressed: () => context.go('/register'),
        ),
        title: const Text(
          'PayDay',
          style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.deepNavy),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12),
            child: Container(
              constraints: const BoxConstraints(maxWidth: 400),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Progress Bar (Step 2 of 3)
                  ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: const LinearProgressIndicator(
                      value: 0.66,
                      backgroundColor: AppColors.borderLight,
                      valueColor: AlwaysStoppedAnimation<Color>(AppColors.primaryOrange),
                      minHeight: 6,
                    ),
                  ),
                  const SizedBox(height: 24),
                  // Icon & Title
                  Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.deepNavy.withValues(alpha: 0.05),
                    ),
                    child: const Icon(Icons.lock_rounded, size: 28, color: AppColors.deepNavy),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Set Security PIN',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: AppColors.deepNavy),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    'Create a 4-digit PIN to secure your wallet and confirm transactions.',
                    style: TextStyle(fontSize: 13, color: AppColors.textSecondary, height: 1.4),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),

                  // PIN Input Visual Boxes
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(4, (index) {
                      bool isFilled = index < _pin.length;
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: isFilled ? AppColors.primaryOrange : AppColors.borderLight,
                            width: isFilled ? 2 : 1.5,
                          ),
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            if (isFilled)
                              BoxShadow(color: AppColors.primaryOrange.withValues(alpha: 0.15), blurRadius: 8, offset: const Offset(0, 4)),
                          ],
                        ),
                        child: Center(
                          child: Text(
                            isFilled ? '•' : '',
                            style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: AppColors.deepNavy),
                          ),
                        ),
                      );
                    }),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Your PIN is encrypted and never shared.',
                    style: TextStyle(fontSize: 11, color: AppColors.textSecondary),
                  ),
                  const SizedBox(height: 24),

                  // Custom Numeric Keypad
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.5),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: AppColors.borderLight.withValues(alpha: 0.3)),
                    ),
                    child: Column(
                      children: [
                        _buildKeypadRow(['1', '2', '3']),
                        const SizedBox(height: 12),
                        _buildKeypadRow(['4', '5', '6']),
                        const SizedBox(height: 12),
                        _buildKeypadRow(['7', '8', '9']),
                        const SizedBox(height: 12),
                        _buildKeypadRow(['', '0', 'backspace']),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildKeypadRow(List<String> keys) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: keys.map((key) {
        if (key.isEmpty) {
          return const SizedBox(width: 64, height: 46);
        }
        return InkWell(
          onTap: () => _onKeyPressed(key),
          borderRadius: BorderRadius.circular(30),
          child: Container(
            width: 64,
            height: 46,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: AppColors.borderLight.withValues(alpha: 0.6)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.02),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Center(
              child: key == 'backspace'
                  ? const Icon(Icons.backspace_outlined, size: 18, color: AppColors.deepNavy)
                  : Text(
                      key,
                      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.deepNavy),
                    ),
            ),
          ),
        );
      }).toList(),
    );
  }
}