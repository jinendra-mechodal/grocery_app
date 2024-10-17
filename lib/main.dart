import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'features/auth/login/view/login_page.dart';
import 'features/auth/ragister/view/register_info_page.dart';
import 'features/auth/ragister/view/register_page.dart';
import 'features/cart/checkout/view/checkout_page.dart';
import 'features/cart/my_cart/view/my_cart_page.dart';
import 'features/home/categories_page/view/all_categories_page.dart';
import 'features/home/home_landing_page/view/home_page.dart';
import 'features/home/product_details/view/product_details_page.dart';
import 'features/onboarding/view/onboarding_page.dart';
import 'features/orders/order_page/view/no_order_history_page.dart';
import 'features/orders/order_page/view/order_history_page.dart';
import 'features/orders/successfull/view/order_successfully_page.dart';
import 'features/profile/edit_profile/view/edit_profile_page.dart';
import 'features/profile/profile_page/view/profile_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Grocery App',
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => OnboardingPage1()),
        GetPage(name: '/login', page: () => LoginPage()),
        GetPage(name: '/register', page: () => RegisterPage()),
        GetPage(name: '/register_info', page: () => RegisterInfoPage()),
        GetPage(name: '/home', page: () => HomePage()),
        GetPage(name: '/product_details', page: () => ProductDetailsPage()),
        GetPage(name: '/all_categories', page: () => AllCategoriesPage()),
        GetPage(name: '/my_cart', page: () => MyCartPage()),
        GetPage(name: '/checkout', page: () => CheckoutPage()),
        GetPage(name: '/order_success', page: () => OrderSuccessfullyPage()),
        GetPage(name: '/no_order_history', page: () => NoOrderHistoryPage()),
        GetPage(name: '/order_history', page: () => OrderHistoryPage()),
        GetPage(name: '/profile', page: () => ProfilePage()),
        GetPage(name: '/edit_profile', page: () => EditProfilePage()),
      ],
      home: HomePage(),
    );
  }
}
