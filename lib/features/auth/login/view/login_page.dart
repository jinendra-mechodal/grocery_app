import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => Get.toNamed('/home'),
              child: Text('Login'),
            ),
            TextButton(
              onPressed: () => Get.toNamed('/register'),
              child: Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}
