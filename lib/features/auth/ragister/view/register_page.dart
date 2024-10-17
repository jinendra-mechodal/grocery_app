import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Register')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => Get.toNamed('/register_info'),
          child: Text('Proceed to Register Info'),
        ),
      ),
    );
  }
}
