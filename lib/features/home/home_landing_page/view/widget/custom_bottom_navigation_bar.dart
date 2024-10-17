import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; // Import the flutter_svg package
import 'package:get/get.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemTapped;

  const CustomBottomNavigationBar({
    Key? key,
    required this.selectedIndex,
    required this.onItemTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Color(0xffFFFFFF),
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/icons/home-icon.svg', // Update with your SVG path for Home
            color: selectedIndex == 0 ? Color(0xff1AB65C) : Color(0xffC8C8D3),
            height: 24,
            width: 24,
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/icons/bag-icon.svg', // Update with your SVG path for My Orders
            color: selectedIndex == 1 ? Color(0xff1AB65C) : Color(0xffC8C8D3),
            height: 24,
            width: 24,
          ),
          label: 'My Orders',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/icons/user-icon.svg', // Update with your SVG path for Account
            color: selectedIndex == 2 ? Color(0xff1AB65C) : Color(0xffC8C8D3),
            height: 24,
            width: 24,
          ),
          label: 'Account',
        ),
      ],
      currentIndex: selectedIndex,
      onTap: (index) {
        // Call the callback function to handle item tap
        onItemTapped(index);
      },
    );
  }
}
