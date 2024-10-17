import 'package:flutter/material.dart';

class MyCartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('My Cart')),
      body: Center(child: Text('Items in your cart.')),
    );
  }
}
