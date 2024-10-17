import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingPage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome to Grocery App!'),
            ElevatedButton(
              onPressed: () => Get.toNamed('/login'),
              child: Text('Get Started'),
            ),
          ],
        ),
      ),
    );
  }
}
