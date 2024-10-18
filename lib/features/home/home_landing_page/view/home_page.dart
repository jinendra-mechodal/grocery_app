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
      //backgroundColor: Color(0xffEFF0F0),
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
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: SvgPicture.asset(
              'assets/icons/trolly-icon.svg', // Update with your SVG path
              color: Color(0xffFFFFFF), // Color for the icon
              height: 24, // Adjust the size as needed
              width: 24, // Adjust the size as needed
            ),
            onPressed: () {
              // Handle cart icon press
            },
          ),
          SizedBox(width: 16), // Space between title and icon
        ],
      ),

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
              CategoriesRow(),
              SizedBox(height: 20),

              // Product List (sample)
              GridView.builder(
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.8,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: 10,
                // Example count
                itemBuilder: (context, index) {
                  return ProductCard(
                    imageUrl: 'https://www.foodiesfeed.com/wp-content/uploads/2023/06/pouring-honey-on-pancakes.jpg',
                    title: 'Product $index',
                    subtitle: 'Fruits',
                    price: '₹${(index + 5.60).toStringAsFixed(2)}/kg',
                  );
                },
              ),

              SizedBox(height: 10),
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
