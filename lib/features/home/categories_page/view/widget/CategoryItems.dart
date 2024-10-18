
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CategoryItem extends StatelessWidget {
  final String imagePath;
  final String label;

  const CategoryItem({required this.imagePath, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 7),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(6),
              topLeft: Radius.circular(6),
            ),
            child: Image.asset(
              imagePath,
              height: 65,
              width: 120,
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(height: 15),
        Text(
          label,
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
        ),
        SizedBox(height: 12),
        SvgPicture.asset(
          'assets/icons/right-arrow-icon.svg', // Update with your SVG path
          color: Color(0xffF38F15),
          height: 10, // Adjust the size as needed
          width: 30, // Adjust the size as needed
        ),
      ],
    );
  }
}
