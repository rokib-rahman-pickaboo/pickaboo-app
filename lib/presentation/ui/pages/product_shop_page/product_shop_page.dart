import 'package:flutter/material.dart';

class ShopSellerIndex extends StatelessWidget {
  const ShopSellerIndex({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Product Shop Screen')),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text('Component: IndexShopSellerIndex')],
        ),
      ),
    );
  }
}
