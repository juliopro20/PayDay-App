import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

class TransactionHistoryScreen extends StatefulWidget {
  const TransactionHistoryScreen({super.key});

  @override
  State<TransactionHistoryScreen> createState() => _TransactionHistoryScreenState();
}

class _TransactionHistoryScreenState extends State<TransactionHistoryScreen> {
  String _selectedFilter = 'All';

  final List<Map<String, dynamic>> _transactions = [
    {
      'title': 'MTN Mobile Money',
      'type': 'Deposit',
      'category': 'Deposits',
      'amount': '+ 50,000 XAF',
      'time': '14:30',
      'section': 'TODAY',
      'isPositive': true,
      'status': 'Success',
      'symbol': 'MTN',
      'color': const Color(0xFFFFB703),
    },
    {
      'title': 'Orange Money',
      'type': 'Withdrawal',
      'category': 'Withdrawals',
      'amount': '- 15,000 XAF',
      'time': '09:15',
      'section': 'TODAY',
      'isPositive': false,
      'status': 'Success',
      'symbol': 'OM',
      'color': const Color(0xFFE85D04),
    },
    {
      'title': 'Bank Transfer',
      'type': 'Deposit',
      'category': 'Deposits',
      'amount': '+ 100,000 XAF',
      'time': 'Pending',
      'section': 'YESTERDAY',
      'isPositive': true,
      'status': 'Pending',
      'symbol': '🏦',
      'color': AppColors.deepNavy,
    },
    {
      'title': 'MTN Mobile Money',
      'type': 'Payment',
      'category': 'Withdrawals',
      'amount': '- 5,000 XAF',
      'time': '16:45',
      'section': 'YESTERDAY',
      'isPositive': false,
      'status': 'Success',
      'symbol': 'MTN',
      'color': const Color(0xFFFFB703),
    },
  ];

  @override
  Widget build(BuildContext context) {
    final filteredTransactions = _transactions.where((tx) {
      if (_selectedFilter == 'All') return true;
      return tx['category'] == _selectedFilter;
    }).toList();

    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Bar
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: const BoxDecoration(color: AppColors.deepNavy, shape: BoxShape.circle),
                        child: const Icon(Icons.person, color: Colors.white, size: 16),
                      ),
                      const SizedBox(width: 10),
                      const Text('PayDay', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.deepNavy)),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      border: Border.all(color: AppColors.borderLight.withValues(alpha: 0.5)),
                    ),
                    child: const Icon(Icons.notifications_outlined, size: 20, color: AppColors.deepNavy),
                  ),
                ],
              ),
            ),

            // Header Title
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('Transaction History', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: AppColors.deepNavy)),
                  SizedBox(height: 4),
                  Text('Review your recent activity', style: TextStyle(fontSize: 13, color: AppColors.textSecondary)),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Filter Chips
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children: ['All', 'Deposits', 'Withdrawals'].map((filter) {
                  bool isSelected = _selectedFilter == filter;
                  return Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: ChoiceChip(
                      label: Text(filter),
                      selected: isSelected,
                      onSelected: (selected) => setState(() => _selectedFilter = filter),
                      selectedColor: AppColors.deepNavy,
                      backgroundColor: Colors.white,
                      labelStyle: TextStyle(
                        color: isSelected ? Colors.white : AppColors.deepNavy,
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 16),

            // List of Transactions
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                itemCount: filteredTransactions.length,
                itemBuilder: (context, index) {
                  final tx = filteredTransactions[index];
                  bool showSectionHeader = index == 0 || filteredTransactions[index - 1]['section'] != tx['section'];

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (showSectionHeader) ...[
                        if (index > 0) const SizedBox(height: 16),
                        Text(
                          tx['section'],
                          style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: AppColors.textSecondary, letterSpacing: 1.2),
                        ),
                        const SizedBox(height: 10),
                      ],
                      Container(
                        margin: const EdgeInsets.only(bottom: 12),
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: AppColors.borderLight.withValues(alpha: 0.6)),
                        ),
                        child: Row(
                          children: [
                            Container(
                              height: 42,
                              width: 42,
                              decoration: BoxDecoration(color: (tx['color'] as Color).withValues(alpha: 0.15), shape: BoxShape.circle),
                              child: Center(
                                child: Text(tx['symbol'], style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: tx['color'])),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(tx['title'], style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppColors.deepNavy)),
                                  const SizedBox(height: 2),
                                  Text(tx['type'], style: const TextStyle(fontSize: 12, color: AppColors.textSecondary)),
                                ],
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  tx['amount'],
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: tx['isPositive'] ? const Color(0xFF2E7D32) : AppColors.deepNavy,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(tx['time'], style: const TextStyle(fontSize: 11, color: AppColors.textSecondary)),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}