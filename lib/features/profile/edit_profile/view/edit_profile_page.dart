import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfilePage extends StatelessWidget {

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Edit Profile')),
      // body: Padding(
      //   padding: const EdgeInsets.all(16.0),
      //   child: Obx(() {
      //     final user = _authViewModel.user.value;
      //     nameController.text = user.name;
      //     emailController.text = user.email;
      //
      //     return Column(
      //       children: [
      //         TextField(
      //           controller: nameController,
      //           decoration: InputDecoration(labelText: 'Name'),
      //         ),
      //         TextField(
      //           controller: emailController,
      //           decoration: InputDecoration(labelText: 'Email'),
      //         ),
      //         SizedBox(height: 20),
      //         ElevatedButton(
      //           onPressed: () {
      //             // Update the user information
      //             _authViewModel.user.value = UserModel(
      //               id: user.id,
      //               name: nameController.text,
      //               email: emailController.text,
      //             );
      //             Get.back(); // Navigate back to Profile Page
      //           },
      //           child: Text('Save Changes'),
      //         ),
      //       ],
      //     );
      //   }),
      // ),
    );
  }
}
