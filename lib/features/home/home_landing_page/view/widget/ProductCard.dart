// ProductCard widget for the products grid
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grocery_app/res/fonts/app_fonts.dart';

class ProductCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subtitle;
  final String price;

  const ProductCard({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xffFFFFFF),
      elevation: 1.4, // Adjust this value for more or less shadow
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(6),
              topRight: Radius.circular(6),
            ),
            child: Image.network(
              imageUrl,
              height: 107,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: poppins500.copyWith(
                    fontSize: 14,
                    color: Color(0xff333836),
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  subtitle,
                  style: poppins400.copyWith(
                    fontSize: 12,
                    color: Color(0xff8F9593),
                  ),
                ),
                SizedBox(height: 5),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      price,
                      style: poppins500.copyWith(
                        fontSize: 18,
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(8), // Padding of 10
                      decoration: BoxDecoration(
                        color: Color(0xffF4F4F3), // Background color
                        borderRadius: BorderRadius.circular(6), // Rounded corners
                      ),
                      child: SvgPicture.asset(
                        'assets/icons/trolly-icon.svg', // Update with your SVG path
                        color: Color(0xffF38F15),
                        height: 12, // Adjust the size as needed
                        width: 18, // Adjust the size as needed
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
