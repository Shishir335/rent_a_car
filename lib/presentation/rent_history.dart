import 'package:flutter/material.dart';

class RentHistoryScreen extends StatelessWidget {
  const RentHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Rent History')),
      body: Center(
        child: const Text(
          'No rent history available.',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
