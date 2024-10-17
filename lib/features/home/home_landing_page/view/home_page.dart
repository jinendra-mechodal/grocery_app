import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
    '/home',          // Home
    '/order_history', // My Orders
    '/profile',       // Account
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
      appBar: AppBar(
        title: Text('Home', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.green,
        actions: [
          IconButton(
            icon: Icon(Icons.mail_outline),
            onPressed: () {
              // Handle mail icon press
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              SizedBox(height: 10,),

              Container(
                height: 60,
                width: screenWidth,
                color: Colors.green,
              ),


              // Search Bar
              Container(
                margin: EdgeInsets.symmetric(vertical: 16),
                padding: EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(30),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search Product here',
                    border: InputBorder.none,
                    icon: Icon(Icons.search),
                  ),
                ),
              ),

              // Categories section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Categories',
                    style: TextStyle(
                      fontSize: screenWidth * 0.05,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      // Handle See All action
                    },
                    child: Text('See All'),
                  ),
                ],
              ),
              SizedBox(height: 10),

              // Categories Row
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    CategoryItem(
                      imageUrl: 'https://via.placeholder.com/50',
                      label: 'Vegetables',
                    ),
                    CategoryItem(
                      imageUrl: 'https://via.placeholder.com/50',
                      label: 'Fruits',
                    ),
                    CategoryItem(
                      imageUrl: 'https://via.placeholder.com/50',
                      label: 'Dairy',
                    ),
                    CategoryItem(
                      imageUrl: 'https://via.placeholder.com/50',
                      label: 'Vegetables',
                    ),
                  ],
                ),
              ),
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
                itemCount: 4, // Example count
                itemBuilder: (context, index) {
                  return ProductCard(
                    imageUrl: 'https://via.placeholder.com/100',
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

