import 'package:flutter/material.dart';

class YourBooksScreen extends StatelessWidget {
  const YourBooksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Books'),
      ),
      body: const Center(
        child: Text('Here are your books'),
      ),
    );
  }
}