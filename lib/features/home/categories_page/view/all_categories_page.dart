import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:grocery_app/features/home/categories_page/view/widget/CategoryItems.dart';

import '../../../../res/fonts/app_fonts.dart';
import '../../home_landing_page/view/widget/custom_bottom_navigation_bar.dart';
import 'data/CategoryItem.dart';

class AllCategoriesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      appBar: AppBar(
        backgroundColor: Color(0xff1AB65C),
        title: Row(
          children: [
            IconButton(
              icon: SvgPicture.asset(
                'assets/icons/left-arro-icon.svg',
                color: Color(0xffFFFFFF),
                height: 24,
                width: 24,
              ),
              onPressed: () {
                Get.back();
              },
            ),
            Text(
              'All Categories',
              style: montserrat700.copyWith(
                fontSize: 24,
                color: Color(0xffFFFFFF),
              ),
            ),
          ],
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(7),
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView( // Wrap body in SingleChildScrollView
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Search Bar
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              margin: EdgeInsets.symmetric(vertical: 16),
              decoration: BoxDecoration(
                color: Color(0xffFFFFFF),
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: Color(0xff1AB65C), width: 0.5), // Green border
              ),
              child: TextField(
                style: montserrat500.copyWith(
                  color: Colors.black, // Text color
                ),
                decoration: InputDecoration(
                  hintText: 'Search Product here',
                  hintStyle: montserrat500.copyWith(
                    color: Color(0xffC8C8D3),
                  ),
                  border: InputBorder.none,
                  icon: SvgPicture.asset(
                    'assets/icons/search_icon.svg', // Update with your SVG path
                    color: Color(0xff1AB65C),
                    height: 24, // Adjust the size as needed
                    width: 24, // Adjust the size as needed
                  ),
                ),
              ),
            ),
            SizedBox(height: 32),
            // GridView for categories
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(), // Disable scrolling on GridView
              padding: EdgeInsets.all(0), // Remove padding for grid
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, // 3 columns
                childAspectRatio: 0.7, // Adjust for the item height/width ratio
                crossAxisSpacing: 16, // Space between columns
                mainAxisSpacing: 16, // Space between rows
              ),
              itemCount: assetCategories.length,
              itemBuilder: (context, index) {
                final category = assetCategories[index];
                return CategoryItem(
                  imagePath: category.imagePath,
                  label: category.label,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
