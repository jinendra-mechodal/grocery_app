import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grocery_app/res/fonts/app_fonts.dart';

class ProductCard extends StatelessWidget {
  final String imagePath; // Changed to imagePath for asset
  final String title;
  final String subtitle;
  final String price;

  const ProductCard({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.subtitle,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xffFFFFFF),
      elevation: 2, // Slightly increased elevation for better shadow effect
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
            // Rounded top corners
            child: Image.asset(
              imagePath, // Use asset image
              height: 107, // Increased height for better visibility
              width: 186,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            // Reduced padding for a cleaner look
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Text(
                    title,
                    style: poppins500.copyWith(
                      fontSize: 16, // Increased font size for title
                      color: Color(0xff333836),
                    ),
                    maxLines: 1, // Limit to 1 line
                    overflow: TextOverflow
                        .ellipsis, // Show ellipsis (...) if overflow
                  ),
                ),

                SizedBox(height: 4),
                Text(
                  subtitle,
                  style: poppins400.copyWith(
                    fontSize: 14,
                    color: Color(0xff8F9593),
                  ),
                ),
                SizedBox(height: 8),
                // Increased space between subtitle and price
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Text(
                            price,
                            style: poppins500.copyWith(
                              fontSize: 18,
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '/kg',
                            style: poppins500.copyWith(
                              fontSize: 14,
                              color: Color(0xff8f9593),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Color(0xffF4F4F3),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: SvgPicture.asset(
                        'assets/icons/trolly-icon.svg',
                        color: Color(0xffF38F15),
                        height: 14, // Adjusted size for better fit
                        width: 18,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
