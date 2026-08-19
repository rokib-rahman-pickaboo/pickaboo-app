import 'package:flutter/material.dart';

class AddCards extends StatelessWidget {
  const AddCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Cards')),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text('Component: IndexAddCardsContainer')],
        ),
      ),
    );
  }
}
