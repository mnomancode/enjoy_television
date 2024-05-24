import 'package:flutter/material.dart';

class NoPayment extends StatelessWidget {
  const NoPayment({super.key, this.message});
  final String? message;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(message ?? 'Payment Error'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }
}
