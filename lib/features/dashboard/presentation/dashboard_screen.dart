import 'package:flutter/material.dart';
import 'package:payday/features/dashboard/presentation/deposit_modal.dart';
import 'package:payday/features/dashboard/screens/transaction_history_screen.dart';
import 'package:payday/features/dashboard/screens/notifications_screen.dart';
import 'package:payday/features/dashboard/screens/profile_screen.dart';
import 'package:payday/features/dashboard/screens/withdraw_screen.dart';
import '../../../../core/theme/app_colors.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _currentIndex = 0;
  bool _hideBalance = false;

  // Helper method to open the Deposit Modal
  void _openDepositModal() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const DepositModal(),
    );
  }

  // Helper method to open the Withdraw Screen
  void _openWithdrawScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const WithdrawScreen()),
    );
  }

  // Home Tab View Widget
  Widget _buildHomeTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Header Top Bar
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const CircleAvatar(
                    radius: 22,
                    backgroundImage: NetworkImage('https://images.unsplash.com/photo-1534528741775-53994a69daeb?w=100'),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('Good Morning,', style: TextStyle(fontSize: 12, color: AppColors.textSecondary)),
                      Text('User', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.deepNavy)),
                    ],
                  ),
                ],
              ),
              GestureDetector(
                onTap: () => setState(() => _currentIndex = 2), // Jump to Notifications tab
                child: Stack(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(color: AppColors.borderLight.withValues(alpha: 0.5)),
                      ),
                      child: const Icon(Icons.notifications_outlined, size: 20, color: AppColors.deepNavy),
                    ),
                    Positioned(
                      right: 10,
                      top: 10,
                      child: Container(
                        height: 8,
                        width: 8,
                        decoration: const BoxDecoration(color: AppColors.primaryOrange, shape: BoxShape.circle),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),

          // Total Balance Card
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF0F172A), Color(0xFF1E293B)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(color: AppColors.deepNavy.withValues(alpha: 0.2), blurRadius: 20, offset: const Offset(0, 10)),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Total Balance', style: TextStyle(fontSize: 13, color: Colors.white70)),
                    IconButton(
                      icon: Icon(
                        _hideBalance ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                        color: Colors.white70,
                        size: 20,
                      ),
                      onPressed: () {
                        setState(() {
                          _hideBalance = !_hideBalance;
                        });
                      },
                    )
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  _hideBalance ? 'FCFA ••••••' : 'FCFA 1,450,000',
                  style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: _openDepositModal,
                        icon: const Icon(Icons.add_rounded, size: 18),
                        label: const Text('Reload', style: TextStyle(fontWeight: FontWeight.bold)),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryOrange,
                          foregroundColor: Colors.white,
                          minimumSize: const Size.fromHeight(48),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          elevation: 0,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: _openWithdrawScreen,
                        icon: const Icon(Icons.send_rounded, size: 18),
                        label: const Text('Send', style: TextStyle(fontWeight: FontWeight.bold)),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.white,
                          minimumSize: const Size.fromHeight(48),
                          side: const BorderSide(color: Colors.white24),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // Quick Actions (Deposit, Withdraw, History) with Bolder Icons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: _openDepositModal,
                  child: _buildActionCard(Icons.download_rounded, 'Deposit'),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: GestureDetector(
                  onTap: _openWithdrawScreen,
                  child: _buildActionCard(Icons.upload_rounded, 'Withdraw'),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: GestureDetector(
                  onTap: () => setState(() => _currentIndex = 1), // Jump to History tab
                  child: _buildActionCard(Icons.receipt_long_rounded, 'History'),
                ),
              ),
            ],
          ),
          const SizedBox(height: 28),

          // Recent Activity Section
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: AppColors.borderLight.withValues(alpha: 0.6)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Recent Activity', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.deepNavy)),
                    GestureDetector(
                      onTap: () => setState(() => _currentIndex = 1),
                      child: const Text('View All', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: AppColors.primaryOrange)),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                _buildActivityItem('OM', 'Orange', '+ 25,000 FCFA', 'Orange Money Transfer', 'Today, 10:45 AM', 'Success', const Color(0xFFE85D04)),
                const Divider(height: 24, color: AppColors.borderLight),
                _buildActivityItem('MTN', 'MTN', '- 12,500 FCFA', 'MTN MoMo Deposit', 'Yesterday, 14:20', 'Success', const Color(0xFFFFB703)),
                const Divider(height: 24, color: AppColors.borderLight),
                _buildActivityItem('🛒', 'Shop', '- 45,000 FCFA', 'Supermarket Bill', 'Oct 24, 09:15 AM', 'Pending', AppColors.deepNavy),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // Network Status Section
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: AppColors.borderLight.withValues(alpha: 0.6)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Network Status', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.deepNavy)),
                const SizedBox(height: 14),
                _buildNetworkStatusRow('MTN MoMo', Colors.amber),
                const SizedBox(height: 10),
                _buildNetworkStatusRow('Orange Money', AppColors.primaryOrange),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      _buildHomeTab(),
      const TransactionHistoryScreen(),
      const NotificationsScreen(),
      const ProfileScreen(),
    ];

    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      body: SafeArea(
        child: screens[_currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        selectedItemColor: AppColors.primaryOrange,
        unselectedItemColor: AppColors.textSecondary,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        elevation: 8,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_rounded), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.receipt_long_rounded), label: 'History'),
          BottomNavigationBarItem(icon: Icon(Icons.notifications_rounded), label: 'Alerts'),
          BottomNavigationBarItem(icon: Icon(Icons.person_rounded), label: 'Profile'),
        ],
      ),
    );
  }

  Widget _buildActionCard(IconData icon, String title) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.borderLight.withValues(alpha: 0.6)),
        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.02), blurRadius: 8, offset: const Offset(0, 4))],
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(color: AppColors.deepNavy.withValues(alpha: 0.05), shape: BoxShape.circle),
            child: Icon(icon, color: AppColors.deepNavy, size: 22),
          ),
          const SizedBox(height: 8),
          Text(title, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: AppColors.deepNavy)),
        ],
      ),
    );
  }

  Widget _buildActivityItem(String symbol, String type, String amount, String title, String subtitle, String status, Color color) {
    bool isSuccess = status == 'Success';
    return Row(
      children: [
        Container(
          height: 44,
          width: 44,
          decoration: BoxDecoration(color: color.withValues(alpha: 0.15), shape: BoxShape.circle),
          child: Center(child: Text(symbol, style: TextStyle(fontWeight: FontWeight.bold, fontSize: symbol.length > 2 ? 16 : 13, color: color))),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: AppColors.deepNavy)),
              const SizedBox(height: 2),
              Text(subtitle, style: const TextStyle(fontSize: 11, color: AppColors.textSecondary)),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(amount, style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: amount.startsWith('+') ? const Color(0xFF2E7D32) : AppColors.deepNavy)),
            const SizedBox(height: 4),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: isSuccess ? const Color(0xFFE8F5E9) : const Color(0xFFFFF8E1),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(status, style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: isSuccess ? const Color(0xFF2E7D32) : const Color(0xFFF57C00))),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildNetworkStatusRow(String name, Color dotColor) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(height: 8, width: 8, decoration: BoxDecoration(color: dotColor, shape: BoxShape.circle)),
            const SizedBox(width: 10),
            Text(name, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: AppColors.deepNavy)),
          ],
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(
            color: const Color(0xFFE8F5E9),
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Text('Online', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Color(0xFF2E7D32))),
        ),
      ],
    );
  }
}