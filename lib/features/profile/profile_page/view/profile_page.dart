import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile')),
      // body: Center(
      //   child: Obx(() {
      //     final user = _authViewModel.user.value;
      //     return Column(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       children: [
      //         Text('Name: ${user.name}'),
      //         Text('Email: ${user.email}'),
      //         ElevatedButton(
      //           onPressed: () {
      //             Get.toNamed('/edit_profile');
      //           },
      //           child: Text('Edit Profile'),
      //         ),
      //       ],
      //     );
      //   }),
      // ),
    );
  }
}
