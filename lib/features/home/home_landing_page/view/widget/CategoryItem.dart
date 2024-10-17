// // CategoryItem widget for the categories row
// import 'package:flutter/material.dart';
//
// class CategoryItem extends StatelessWidget {
//   final String imageUrl;
//   final String label;
//
//   const CategoryItem({
//     Key? key,
//     required this.imageUrl,
//     required this.label,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         // Container(
//         //   margin: EdgeInsets.only(right: 10),
//         //   height: 70,
//         //   width: 70,
//         //   decoration: BoxDecoration(
//         //     shape: BoxShape.circle,
//         //     image: DecorationImage(
//         //       image: NetworkImage(imageUrl),
//         //       fit: BoxFit.cover,
//         //     ),
//         //   ),
//         // ),
//         Container(
//           height: 70,
//           width: 70,
//           decoration: BoxDecoration(
//             color: Colors.white, // Optional background color
//             borderRadius: BorderRadius.circular(12), // Match the ClipRRect radius
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.black.withOpacity(0.1),
//                 blurRadius: 4,
//                 offset: Offset(0, 2), // changes position of shadow
//               ),
//             ],
//           ),
//           child: ClipRRect(
//             borderRadius: BorderRadius.circular(12),
//             child: Image.network(
//               imageUrl,
//               height: 70,
//               width: 70,
//               fit: BoxFit.cover, // Ensure the image covers the container
//             ),
//           ),
//         ),
//         // ClipRRect(
//         //   borderRadius: BorderRadius.circular(12),
//         //   child: Image.network(
//         //     imageUrl,
//         //     height: 70,
//         //     width: 70,
//         //     //fit: BoxFit.cover,
//         //   ),
//         // ),
//         SizedBox(height: 5),
//         Text(
//           label,
//           style: TextStyle(
//             fontSize: 12,
//             fontWeight: FontWeight.w500,
//           ),
//         ),
//       ],
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grocery_app/res/fonts/app_fonts.dart';

class CategoriesRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // List of categories
    final categories = [
      {
        'imageUrl': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTsm8ikrxT6IeRSAlPBWkFRJ-vJeXzGGg48BUGLr6ND0hmGjdnfyZ_KeYswJYqFwOG8kW8&usqp=CAU',
        'label': 'Vegetables',
      },
      {
        'imageUrl': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTsm8ikrxT6IeRSAlPBWkFRJ-vJeXzGGg48BUGLr6ND0hmGjdnfyZ_KeYswJYqFwOG8kW8&usqp=CAU',
        'label': 'Fruits',
      },
      {
        'imageUrl': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTsm8ikrxT6IeRSAlPBWkFRJ-vJeXzGGg48BUGLr6ND0hmGjdnfyZ_KeYswJYqFwOG8kW8&usqp=CAU',
        'label': 'Dairy',
      },
      {
        'imageUrl': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTsm8ikrxT6IeRSAlPBWkFRJ-vJeXzGGg48BUGLr6ND0hmGjdnfyZ_KeYswJYqFwOG8kW8&usqp=CAU',
        'label': 'Grains',
      },
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: categories.map((category) {
          return CategoryItem(
            imageUrl: category['imageUrl']!,
            label: category['label']!,
          );
        }).toList(),
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final String imageUrl;
  final String label;

  CategoryItem({required this.imageUrl, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:  EdgeInsets.symmetric(
            horizontal: 14,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(6),
              topLeft:Radius.circular(6),
            ),
            child: Image.network(
              imageUrl,
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
        Text(label,
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
