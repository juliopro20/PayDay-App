import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import 'verify_account_step1_screen.dart';
import 'profile_screens/my_qr_code_screen.dart';
import 'profile_screens/personal_information_screen.dart';
import 'profile_screens/payment_methods_screen.dart';
import 'profile_screens/change_security_pin_screen.dart';
import 'profile_screens/two_factor_auth_screen.dart';
import 'profile_screens/help_center_screen.dart';
import 'profile_screens/contact_us_screen.dart';
import 'profile_screens/terms_conditions_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _biometricEnabled = true;

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Log Out', style: TextStyle(color: AppColors.deepNavy, fontWeight: FontWeight.bold)),
        content: const Text('Are you sure you want to log out of your PayDay account?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel', style: TextStyle(color: AppColors.textSecondary)),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              // Handle logout logic here
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            child: const Text('Log Out', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'User Profile',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: AppColors.deepNavy),
              ),
              const SizedBox(height: 20),

              // Profile Header Card
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: AppColors.borderLight.withValues(alpha: 0.6)),
                  boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.02), blurRadius: 10, offset: const Offset(0, 4))],
                ),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        const CircleAvatar(
                          radius: 40,
                          backgroundImage: NetworkImage('https://images.unsplash.com/photo-1534528741775-53994a69daeb?w=150'),
                        ),
                        Positioned(
                          right: 0,
                          bottom: 0,
                          child: Container(
                            padding: const EdgeInsets.all(4),
                            decoration: const BoxDecoration(color: AppColors.deepNavy, shape: BoxShape.circle),
                            child: const Icon(Icons.edit, size: 14, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('John Doe', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.deepNavy)),
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                          decoration: BoxDecoration(color: const Color(0xFFE8F5E9), borderRadius: BorderRadius.circular(6)),
                          child: Row(
                            children: const [
                              Icon(Icons.verified, size: 12, color: Color(0xFF10B981)),
                              SizedBox(width: 4),
                              Text('Verified', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Color(0xFF10B981))),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    const Text('+237 671 234 567', style: TextStyle(fontSize: 13, color: AppColors.textSecondary)),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton.icon(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const MyQrCodeScreen()));
                            },
                            icon: const Icon(Icons.qr_code_rounded, size: 16),
                            label: const FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text('My QR Code', style: TextStyle(fontSize: 12)),
                            ),
                            style: OutlinedButton.styleFrom(
                              foregroundColor: AppColors.deepNavy,
                              minimumSize: const Size.fromHeight(46),
                              padding: const EdgeInsets.symmetric(horizontal: 6),
                              side: BorderSide(color: AppColors.borderLight.withValues(alpha: 0.8)),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const VerifyAccountStep1Screen()));
                            },
                            icon: const Icon(Icons.arrow_upward_rounded, size: 16),
                            // Wrapped in FittedBox to prevent awkward text wrapping on narrow screens
                            label: const FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text('Upgrade Account', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primaryOrange,
                              foregroundColor: Colors.white,
                              minimumSize: const Size.fromHeight(46),
                              padding: const EdgeInsets.symmetric(horizontal: 6),
                              elevation: 0,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Section: Account
              const Text('ACCOUNT', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: AppColors.textSecondary, letterSpacing: 1.2)),
              const SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: AppColors.borderLight.withValues(alpha: 0.6)),
                ),
                child: Column(
                  children: [
                    _buildProfileTile(Icons.person_outline_rounded, 'Personal Information', () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const PersonalInformationScreen()));
                    }),
                    const Divider(height: 1, color: AppColors.borderLight),
                    _buildProfileTile(Icons.account_balance_wallet_outlined, 'Payment Methods', () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const PaymentMethodsScreen()));
                    }),
                    const Divider(height: 1, color: AppColors.borderLight),
                    _buildProfileTile(
                      Icons.shield_outlined,
                      'KYC Status',
                      () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const VerifyAccountStep1Screen()));
                      },
                      trailingWidget: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(color: const Color(0xFFE8F5E9), borderRadius: BorderRadius.circular(8)),
                        child: const Text('Approved', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Color(0xFF10B981))),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Section: Security
              const Text('SECURITY', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: AppColors.textSecondary, letterSpacing: 1.2)),
              const SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: AppColors.borderLight.withValues(alpha: 0.6)),
                ),
                child: Column(
                  children: [
                    _buildProfileTile(Icons.lock_outline_rounded, 'Change Security PIN', () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const ChangeSecurityPinScreen()));
                    }),
                    const Divider(height: 1, color: AppColors.borderLight),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(color: AppColors.deepNavy.withValues(alpha: 0.05), shape: BoxShape.circle),
                            child: const Icon(Icons.fingerprint_rounded, size: 20, color: AppColors.deepNavy),
                          ),
                          const SizedBox(width: 14),
                          const Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Biometric Login', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: AppColors.deepNavy)),
                                Text('Face ID / Touch ID', style: TextStyle(fontSize: 11, color: AppColors.textSecondary)),
                              ],
                            ),
                          ),
                          Switch(
                            value: _biometricEnabled,
                            activeThumbColor: AppColors.primaryOrange,
                            onChanged: (val) => setState(() => _biometricEnabled = val),
                          ),
                        ],
                      ),
                    ),
                    const Divider(height: 1, color: AppColors.borderLight),
                    _buildProfileTile(Icons.security_rounded, 'Two-Factor Authentication', () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const TwoFactorAuthScreen()));
                    }),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Section: Support & Legal
              const Text('SUPPORT & LEGAL', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: AppColors.textSecondary, letterSpacing: 1.2)),
              const SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: AppColors.borderLight.withValues(alpha: 0.6)),
                ),
                child: Column(
                  children: [
                    _buildProfileTile(Icons.help_outline_rounded, 'Help Center', () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const HelpCenterScreen()));
                    }),
                    const Divider(height: 1, color: AppColors.borderLight),
                    _buildProfileTile(Icons.chat_bubble_outline_rounded, 'Contact Us', () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const ContactUsScreen()));
                    }),
                    const Divider(height: 1, color: AppColors.borderLight),
                    _buildProfileTile(Icons.description_outlined, 'Terms & Conditions', () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const TermsConditionsScreen()));
                    }),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Log Out Button
              OutlinedButton.icon(
                onPressed: () => _showLogoutDialog(context),
                icon: const Icon(Icons.logout_rounded, size: 18, color: Colors.red),
                label: const Text('Log Out', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.red)),
                style: OutlinedButton.styleFrom(
                  backgroundColor: const Color(0xFFFFEBEE),
                  side: BorderSide.none,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileTile(IconData icon, String title, VoidCallback onTap, {Widget? trailingWidget}) {
    return ListTile(
      onTap: onTap,
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(color: AppColors.deepNavy.withValues(alpha: 0.05), shape: BoxShape.circle),
        child: Icon(icon, size: 20, color: AppColors.deepNavy),
      ),
      title: Text(title, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: AppColors.deepNavy)),
      trailing: trailingWidget ?? const Icon(Icons.arrow_forward_ios_rounded, size: 14, color: AppColors.textSecondary),
    );
  }
}