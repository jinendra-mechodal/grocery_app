import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../res/fonts/app_fonts.dart';
import 'widget/CategoryItem.dart';
import 'widget/ProductCard.dart';
import 'widget/custom_bottom_navigation_bar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  // Navigation routes
  final List<String> _routes = [
    '/home', // Home
    '/order_history', // My Orders
    '/profile', // Account
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    // Navigate to the corresponding route
    Get.toNamed(_routes[index]);
  }

  @override
  Widget build(BuildContext context) {
    // MediaQuery for screen width and height to make it responsive
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      appBar: AppBar(
          backgroundColor: Color(0xff1AB65C),
          title: Text(
            'Home',
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
          automaticallyImplyLeading: false),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
              hintStyle:  montserrat500.copyWith(
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

              // Categories section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Categories',
                    style: poppins600.copyWith(
                      fontSize: 16,
                      color: Color(0xff333836),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      // Handle See All action
                    },
                    child: Text('See All',
                      style: poppins400.copyWith(
                        fontSize: 12,
                        color: Color(0xff333836),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),

              // Categories Row
              // SingleChildScrollView(
              //   scrollDirection: Axis.horizontal,
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //     crossAxisAlignment: CrossAxisAlignment.center,
              //     children: [
              //       CategoryItem(
              //         imageUrl: 'https://t4.ftcdn.net/jpg/00/65/70/65/360_F_65706597_uNm2SwlPIuNUDuMwo6stBd81e25Y8K8s.jpg',
              //         label: 'Vegetables',
              //       ),
              //
              //       CategoryItem(
              //         imageUrl: 'https://via.placeholder.com/50',
              //         label: 'Fruits',
              //       ),
              //       CategoryItem(
              //         imageUrl: 'https://via.placeholder.com/50',
              //         label: 'Dairy',
              //       ),
              //       CategoryItem(
              //         imageUrl: 'https://via.placeholder.com/50',
              //         label: 'Vegetables',
              //       ),
              //     ],
              //   ),
              // ),
              CategoriesRow(),
              SizedBox(height: 20),

              // Product List (sample)
              Text(
                'Home',
                style: TextStyle(
                  fontSize: screenWidth * 0.06,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.7,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: 10,
                // Example count
                itemBuilder: (context, index) {
                  return ProductCard(
                    imageUrl: 'https://www.foodiesfeed.com/wp-content/uploads/2023/06/pouring-honey-on-pancakes.jpg',
                    title: 'Product $index',
                    price: '₹${(index + 5.60).toStringAsFixed(2)}/kg',
                  );
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped, // Pass the tap handler
      ),
    );
  }
}
