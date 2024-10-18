import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'features/home/home_landing_page/view/home_page.dart';
import 'res/routes/routes.dart';
import 'res/routes/routes_name.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Grocery App',
      initialRoute: AppRoutes.onboarding,
      getPages: AppPages.pages,
      home: HomePage(), // Set a default home page if needed
    );
  }
}
