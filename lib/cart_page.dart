
import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  num totalProductBought;
  CartPage(this.totalProductBought, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart Page"),
        centerTitle: true,
      ),
      body: Center(
        child: Text("Total Products Bought :  $totalProductBought"),
      ),
    );
  }
}