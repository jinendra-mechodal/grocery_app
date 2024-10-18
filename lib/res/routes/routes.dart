// app_pages.dart
import 'package:get/get.dart';

import '../../features/auth/login/view/login_page.dart';
import '../../features/auth/ragister/view/register_info_page.dart';
import '../../features/auth/ragister/view/register_page.dart';
import '../../features/cart/checkout/view/checkout_page.dart';
import '../../features/cart/my_cart/view/my_cart_page.dart';
import '../../features/home/categories_page/view/all_categories_page.dart';
import '../../features/home/home_landing_page/view/view/home_page.dart';
import '../../features/home/product_details/view/product_details_page.dart';
import '../../features/onboarding/view/onboarding_page.dart';
import '../../features/orders/order_page/view/no_order_history_page.dart';
import '../../features/orders/order_page/view/order_history_page.dart';
import '../../features/orders/successfull/view/order_successfully_page.dart';
import '../../features/profile/edit_profile/view/edit_profile_page.dart';
import '../../features/profile/profile_page/view/profile_page.dart';
import 'routes_name.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
        name: AppRoutes.onboarding,
        page: () => const OnboardingPage1(),
        transition: Transition.fade),
    GetPage(
        name: AppRoutes.login,
        page: () => LoginPage(),
        transition: Transition.rightToLeft),
    GetPage(
        name: AppRoutes.register,
        page: () => RegisterPage(),
        transition: Transition.rightToLeft),
    GetPage(
        name: AppRoutes.registerInfo,
        page: () => AddressInfoPage(),
        transition: Transition.rightToLeft),
    GetPage(
        name: AppRoutes.home,
        page: () => HomePage(),
        transition: Transition.fade),
    GetPage(
        name: AppRoutes.productDetails,
        page: () => ProductDetailsPage(),
        transition: Transition.fadeIn),
    GetPage(
        name: AppRoutes.allCategories,
        page: () => AllCategoriesPage(),
        transition: Transition.fade),
    GetPage(
        name: AppRoutes.myCart,
        page: () => MyCartPage(),
        transition: Transition.rightToLeft),
    GetPage(
        name: AppRoutes.checkout,
        page: () => CheckoutPage(),
        transition: Transition.rightToLeft),
    GetPage(
        name: AppRoutes.orderSuccess,
        page: () => OrderSuccessfullyPage(),
        transition: Transition.fade),
    GetPage(
        name: AppRoutes.noOrderHistory,
        page: () => NoOrderHistoryPage(),
        transition: Transition.fade),
    GetPage(
        name: AppRoutes.orderHistory,
        page: () => OrderHistoryPage(),
        transition: Transition.fade),
    GetPage(
        name: AppRoutes.profile,
        page: () => ProfilePage(),
        transition: Transition.fade),
    GetPage(
        name: AppRoutes.editProfile,
        page: () => EditProfilePage(),
        transition: Transition.fade),
  ];
}
