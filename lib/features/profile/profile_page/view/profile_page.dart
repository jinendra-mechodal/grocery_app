import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../res/fonts/app_fonts.dart';
import '../../../../res/routes/routes_name.dart';
import '../../../home/home_landing_page/view/widget/custom_bottom_navigation_bar.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // When back button is pressed, navigate to Home
        Get.offNamed(AppRoutes.home); // Use Get.offNamed to replace the Profile page with Home
        return false; // Return false to prevent default back behavior
      },
      child: Scaffold(
        // appBar: AppBar(title: Text('Profile')),
        backgroundColor: Color(0xffFFFFFF),
        //backgroundColor: Color(0xffEFF0F0),
        appBar: AppBar(
          backgroundColor: Color(0xff1AB65C),
          title: Text(
            'All Categories',
            style: montserrat700.copyWith(
              fontSize: 24,
              color: Color(0xffFFFFFF),
            ),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(7),
            ),
          ),
          automaticallyImplyLeading: false,

          // actions: [
          //   IconButton(
          //     icon: SvgPicture.asset(
          //       'assets/icons/trolly-icon.svg', // Update with your SVG path
          //       color: Color(0xffFFFFFF), // Color for the icon
          //       height: 24, // Adjust the size as needed
          //       width: 24, // Adjust the size as needed
          //     ),
          //     onPressed: () {
          //       // Handle cart icon press
          //     },
          //   ),
          //   SizedBox(width: 16), // Space between title and icon
          // ],
        ),
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
      ),
    );
  }
}
