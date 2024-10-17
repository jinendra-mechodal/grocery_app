import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../home/home_landing_page/view/widget/custom_bottom_navigation_bar.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile')),
      body: Center(child: Text('Profile Page')),
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedIndex: 2, // Set the appropriate index
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
