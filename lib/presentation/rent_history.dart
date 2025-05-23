import 'package:flutter/material.dart';

class RentHistoryScreen extends StatelessWidget {
  const RentHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: const Text(
        'No rent history available.',
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}
