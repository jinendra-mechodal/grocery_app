
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderSuccessfullyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   title: Text('Order Successful'),
      //   centerTitle: true,
      // ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Success Icon
            Icon(
              Icons.check_circle,
              size: 100,
              color: Colors.green,
            ),
            SizedBox(height: 20),

            // Order Successfully Text
            Text(
              'Order Successfully',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),

            // Order detail message
            Text(
              'Order Detail successfully transferred to admin, we will contact you soon.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),

            // Contact information
            Text(
              'If you have any query, contact us at:',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[700],
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 5),

            // Email contact
            GestureDetector(
              onTap: () {
                // You can handle email tap event here if necessary
              },
              child: Text(
                'tanveernaikwadi51@gmail.com',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.green,
                  decoration: TextDecoration.underline,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 40),

            // "Go to Home" button
            ElevatedButton(
              onPressed: () {
                Get.offNamed('/home'); // Navigate back to Home Page
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green, // Green color for the button
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                'Go to Home',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
