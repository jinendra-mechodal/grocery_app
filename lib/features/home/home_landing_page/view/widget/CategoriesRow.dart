import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grocery_app/res/fonts/app_fonts.dart';

import '../../../categories_page/view/data/CategoryItem.dart';

class CategoriesRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // Asset Categories
          ...assetCategories.map((category) {
            return CategoryItem(
              image: category.imagePath,
              label: category.label,
              isAsset: true,
            );
          }).toList(),
        ],
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final String image;
  final String label;
  final bool isAsset;

  CategoryItem({required this.image, required this.label, required this.isAsset});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 14),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(6),
              topLeft: Radius.circular(6),
            ),
            child: isAsset
                ? Image.asset(
              image,
              height: 52,
              width: 95,
              fit: BoxFit.cover,
            )
                : Image.network(
              image,
              height: 52,
              width: 95,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: 70,
                  width: 70,
                  color: Colors.grey, // Fallback color
                  child: Icon(Icons.error), // Error icon
                );
              },
            ),
          ),
        ),
        SizedBox(height: 14),
        Text(
          label,
          style: poppins500.copyWith(
            color: Color(0xff333836),
            fontSize: 12,
          ),
        ),
        SizedBox(height: 4),
        SvgPicture.asset(
          'assets/icons/right-arrow-icon.svg', // Update with your SVG path
          color: Color(0xffF38F15),
          height: 8, // Adjust the size as needed
          width: 23, // Adjust the size as needed
        ),
      ],
    );
  }
}
