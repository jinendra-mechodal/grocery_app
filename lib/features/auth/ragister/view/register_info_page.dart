import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../res/routes/routes_name.dart';

class AddressInfoPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController addressTypeController = TextEditingController();
  final TextEditingController addressLine1Controller = TextEditingController();
  final TextEditingController addressLine2Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Address Information'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Address Information',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                // Address Type Field
                Text(
                  'Address Type',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 8),
                TextFormField(
                  controller: addressTypeController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Home',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter an address type';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
            
                // Address Line 1 Field
                Text(
                  'Address Line 1',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 8),
                TextFormField(
                  controller: addressLine1Controller,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter your address here',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the address';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
            
                // Address Line 2 (Optional) Field
                Text(
                  'Address Line 2 (optional)',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 8),
                TextFormField(
                  controller: addressLine2Controller,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Optional address details',
                  ),
                ),
                SizedBox(height: 20),
            
                // Submit Button
                ElevatedButton(
                  onPressed: () {
                    Get.offNamed(AppRoutes.checkout);
                    // if (_formKey.currentState!.validate()) {
                    //   // Process the form data
                    //   ScaffoldMessenger.of(context).showSnackBar(
                    //     SnackBar(content: Text('Address Saved Successfully')),
                    //   );
                    // }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Next',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
