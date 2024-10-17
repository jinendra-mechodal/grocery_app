import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NoOrderHistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Order History')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.info, size: 100, color: Colors.blue),
            SizedBox(height: 20),
            Text(
              'No order history found.',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Get.offNamed('/home'); // Navigate back to Home Page
              },
              child: Text('Go to Home'),
            ),
          ],
        ),
      ),
    );
  }
}
