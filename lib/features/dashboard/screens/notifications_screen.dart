import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  String _selectedFilter = 'All';

  final List<Map<String, dynamic>> _notifications = [
    {
      'title': 'Deposit Successful',
      'body': 'You have successfully received 50,000 XAF via Orange Money.',
      'time': 'Just now',
      'section': 'TODAY',
      'category': 'Transactions',
      'isUnread': true,
      'icon': Icons.arrow_downward_rounded,
      'color': AppColors.primaryOrange,
    },
    {
      'title': 'Security Update',
      'body': 'A new login was detected from a new device in Douala, CM.',
      'time': '2h ago',
      'section': 'TODAY',
      'category': 'System',
      'isUnread': true,
      'hasAction': true,
      'icon': Icons.security_rounded,
      'color': AppColors.deepNavy,
    },
    {
      'title': 'Transfer Sent',
      'body': 'Your transfer of 15,000 XAF to MTN Mobile Money was successful.',
      'time': '10:45 AM',
      'section': 'YESTERDAY',
      'category': 'Transactions',
      'isUnread': false,
      'icon': Icons.arrow_upward_rounded,
      'color': AppColors.deepNavy,
    },
    {
      'title': 'System Maintenance',
      'body': 'Scheduled maintenance will occur tonight at 2:00 AM. Services may be briefly interrupted.',
      'time': '8:00 AM',
      'section': 'YESTERDAY',
      'category': 'System',
      'isUnread': false,
      'icon': Icons.info_outline_rounded,
      'color': Colors.blue,
    },
  ];

  void _markAllAsRead() {
    setState(() {
      for (var notif in _notifications) {
        notif['isUnread'] = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final filteredNotifications = _notifications.where((notif) {
      if (_selectedFilter == 'All') return true;
      return notif['category'] == _selectedFilter;
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
                      border: Border.all(color: AppColors.borderLight.withOpacity(0.5)),
                    ),
                    child: const Icon(Icons.notifications_outlined, size: 20, color: AppColors.deepNavy),
                  ),
                ],
              ),
            ),

            // Alerts Header & Mark all as read
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text('Alerts', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: AppColors.deepNavy)),
                  GestureDetector(
                    onTap: _markAllAsRead,
                    child: const Text('Mark all as read', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: AppColors.primaryOrange)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Filter Chips
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children: ['All', 'Transactions', 'System'].map((filter) {
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

            // List of Notifications
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                itemCount: filteredNotifications.length,
                itemBuilder: (context, index) {
                  final notif = filteredNotifications[index];
                  bool showSectionHeader = index == 0 || filteredNotifications[index - 1]['section'] != notif['section'];

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (showSectionHeader) ...[
                        if (index > 0) const SizedBox(height: 16),
                        Text(
                          notif['section'],
                          style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: AppColors.textSecondary, letterSpacing: 1.2),
                        ),
                        const SizedBox(height: 10),
                      ],
                      Container(
                        margin: const EdgeInsets.only(bottom: 12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: AppColors.borderLight.withOpacity(0.6)),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Stack(
                            children: [
                              if (notif['isUnread'])
                                Positioned(
                                  left: 0,
                                  top: 0,
                                  bottom: 0,
                                  child: Container(width: 5, color: AppColors.primaryOrange),
                                ),
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(color: (notif['color'] as Color).withOpacity(0.15), shape: BoxShape.circle),
                                      child: Icon(notif['icon'], color: notif['color'], size: 20),
                                    ),
                                    const SizedBox(width: 12),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(notif['title'], style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppColors.deepNavy)),
                                              Text(notif['time'], style: const TextStyle(fontSize: 11, color: AppColors.textSecondary)),
                                            ],
                                          ),
                                          const SizedBox(height: 4),
                                          Text(notif['body'], style: const TextStyle(fontSize: 12, color: AppColors.textSecondary, height: 1.3)),
                                          if (notif['hasAction'] == true) ...[
                                            const SizedBox(height: 10),
                                            GestureDetector(
                                              onTap: () {
                                                ScaffoldMessenger.of(context).showSnackBar(
                                                  const SnackBar(content: Text('Opening security details...')),
                                                );
                                              },
                                              child: const Text('Review Activity', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: AppColors.primaryOrange)),
                                            ),
                                          ],
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
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