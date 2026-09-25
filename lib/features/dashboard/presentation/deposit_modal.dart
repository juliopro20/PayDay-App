import 'package:flutter/material.dart';
import '../screens/amount_deposit_screen.dart';

class DepositModal extends StatelessWidget {
  const DepositModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Deposit Funds',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF0F172A)),
              ),
              IconButton(
                icon: const Icon(Icons.close, color: Color(0xFF64748B)),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
          const SizedBox(height: 8),
          const Text(
            'Select your preferred mobile money provider to fund your PayDay wallet.',
            style: TextStyle(fontSize: 14, color: Color(0xFF64748B)),
          ),
          const SizedBox(height: 20),
          
          // MTN MoMo Option
          _ProviderCard(
            title: 'MTN Mobile Money',
            subtitle: 'Deposit instantly via your MTN MoMo account.',
            iconBg: Colors.amber.shade100,
            icon: Icons.phone_android,
            iconColor: Colors.amber.shade800,
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AmountDepositScreen(providerName: 'MTN Mobile Money'),
                ),
              );
            },
          ),
          const SizedBox(height: 12),

          // Orange Money Option
          _ProviderCard(
            title: 'Orange Money',
            subtitle: 'Deposit instantly via your Orange Money account.',
            iconBg: Colors.orange.shade100,
            icon: Icons.phone_android,
            iconColor: Colors.orange.shade800,
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AmountDepositScreen(providerName: 'Orange Money'),
                ),
              );
            },
          ),
          const SizedBox(height: 24),
          
          SizedBox(
            width: double.infinity,
            child: TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel', style: TextStyle(color: Color(0xFF64748B), fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      ),
    );
  }
}

class _ProviderCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final Color iconBg;
  final IconData icon;
  final Color iconColor;
  final VoidCallback onTap;

  const _ProviderCard({
    required this.title,
    required this.subtitle,
    required this.iconBg,
    required this.icon,
    required this.iconColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xFFE2E8F0)),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(color: iconBg, shape: BoxShape.circle),
              child: Icon(icon, color: iconColor),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  const SizedBox(height: 4),
                  Text(subtitle, style: const TextStyle(fontSize: 12, color: Color(0xFF64748B))),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}