import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../home/home_landing_page/view/widget/custom_bottom_navigation_bar.dart';

class OrderHistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Order History')),
      body: Center(child: Text('Order History Page')),
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedIndex: 1, // Set the appropriate index
        onItemTapped: (index) {
          // Handle navigation
          if (index == 0) {
            Get.toNamed('/home');
          } else if (index == 1) {
            Get.toNamed('/order_history');
          } else {
            Get.toNamed('/profile');
          }
        },
      ),
    );
  }
}
