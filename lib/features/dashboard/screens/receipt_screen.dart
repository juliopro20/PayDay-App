import 'package:flutter/material.dart';

class ReceiptScreen extends StatelessWidget {
  final String amount;
  final String provider;

  const ReceiptScreen({super.key, required this.amount, required this.provider});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('PayDay', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      ),
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(20),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(color: Colors.green.shade100, shape: BoxShape.circle),
                child: const Icon(Icons.check, color: Colors.green, size: 28),
              ),
              const SizedBox(height: 12),
              const Text('Deposit Successful', style: TextStyle(fontSize: 14, color: Color(0xFF64748B))),
              const SizedBox(height: 4),
              Text('$amount XAF', style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF0F172A))),
              const Divider(height: 32),

              _receiptRow('Date & Time', 'Oct 24, 2023, 14:32'),
              const SizedBox(height: 12),
              _receiptRow('Transaction ID', 'TXN-847291A'),
              const SizedBox(height: 12),
              _receiptRow('Payment Channel', provider),
              const SizedBox(height: 12),
              _receiptRow('Sent From', '+237 671 234 567'),
              const SizedBox(height: 12),
              _receiptRow('Sent to', 'My Wallet\nPayDay Account', alignEnd: true),
              const SizedBox(height: 12),
              _receiptRow('Amount Sent', '$amount XAF'),
              const SizedBox(height: 12),
              _receiptRow('Fee', '250 XAF'),

              const SizedBox(height: 24),

              // Share Receipt Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFC2410C),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Receipt shared successfully!')),
                    );
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.share, color: Colors.white, size: 18),
                      SizedBox(width: 8),
                      Text('Share Receipt', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),

              // Download PDF Button
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    side: const BorderSide(color: Color(0xFFCBD5E1)),
                  ),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Receipt downloaded as PDF!')),
                    );
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.download, color: Color(0xFF0F172A), size: 18),
                      SizedBox(width: 8),
                      Text('Download PDF', style: TextStyle(color: Color(0xFF0F172A), fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _receiptRow(String title, String value, {bool alignEnd = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(color: Color(0xFF64748B), fontSize: 13)),
        Text(
          value,
          textAlign: alignEnd ? TextAlign.right : TextAlign.left,
          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13, color: Color(0xFF0F172A)),
        ),
      ],
    );
  }
}