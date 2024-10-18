import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../res/fonts/app_fonts.dart';
import '../../../../res/routes/routes_name.dart';
import '../../home_landing_page/view/data/product_data.dart';
import '../../home_landing_page/view/widget/custom_bottom_navigation_bar.dart';

class ProductDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Product product = Get.arguments;

    return WillPopScope(
      onWillPop: () async {
        // When back button is pressed, navigate to Home
        Get.offNamed(AppRoutes
            .home); // Use Get.offNamed to replace the Profile page with Home
        return false; // Return false to prevent default back behavior
      },
      child: Scaffold(
        backgroundColor: Color(0xffFFFFFF),
        //backgroundColor: Color(0xffEFF0F0),
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
                'Product Details',
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
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),

                // Product Image
                Container(
                  height: 210,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                      image: AssetImage(product.imagePath),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 50),

                // Product Title and Price per kg
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.title,
                          style: poppins500.copyWith(
                              fontSize: 20, color: Color(0xff333836)),
                        ),
                        //SizedBox(height: 5,),
                        // Subtitle (Category)
                        Text(
                          product.subtitle,
                          style: poppins400.copyWith(
                              fontSize: 14, color: Color(0xff8F9593)),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "${product.price} ",
                          style: poppins500.copyWith(
                            fontSize: 12,
                            color: Color(0xff1AB65C),
                          ),
                        ),
                        Text(
                          "/kg",
                          style: poppins500.copyWith(
                            fontSize: 12,
                            color: Color(0xff8F9593),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                SizedBox(height: 30),

                // Description Section
                Text(
                  'Description',
                  style: poppins500.copyWith(
                      fontSize: 16, color: Color(0xff333836)),
                ),
                SizedBox(height: 8),
                Text(
                  'Praesent laoreet nisi semper, mollis nunc sed, hendrerit ipsum. Nam vel accumsan justo. Nulla egestas dui ut justo accumsan, ac tempus mi condimentum. Praesent laoreet nisi semper, mollis nunc sed, hendrerit ipsum. Nam vel accumsan justo. Nulla egestas dui ut justo accumsan, ac tempus mi condimentum.',
                  style: poppins400.copyWith(
                      fontSize: 12, color: Color(0xff8F9593)),
                ),

                SizedBox(height: 80),

                // Quantity Selector and Final Price
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Color(0xffF4F4F3),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: IconButton(
                                icon: Icon(Icons.remove, size: 20),
                                onPressed: () {
                                  // Decrease quantity
                                },
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Row(
                              children: [
                                Text(
                                  '2',
                                  // dynamically update this based on the quantity
                                  style: TextStyle(fontSize: 16),
                                ),
                                Text(
                                  '/kg',
                                  // dynamically update this based on the quantity
                                  style: TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Color(0xffF4F4F3),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: IconButton(
                                icon: Icon(Icons.add, size: 20),
                                onPressed: () {
                                  // Decrease quantity
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "₹4.90",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "/kg",
                          style:
                              TextStyle(fontSize: 18, color: Color(0xff8F9593)),
                        ),
                      ],
                    ),
                  ],
                ),

                SizedBox(height: 20),
                // Add to Cart Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      // Add to cart functionality
                      Get.toNamed(AppRoutes.myCart);
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      backgroundColor: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(7), // Set the radius here
                      ),
                    ),
                    child: Text(
                      'Add to cart',
                      style: poppins500.copyWith(fontSize: 16, color: Color(0xffFFFFFF)),
                    ),
                  ),
                ),

                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
