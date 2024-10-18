import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../res/fonts/app_fonts.dart';
import '../../../../res/routes/routes_name.dart';

class CheckoutPage extends StatefulWidget {
  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  int selectedAddressIndex = 0; // Tracks which address is selected

  final List<Map<String, String>> addresses = [
    {'type': 'Home', 'address': '36 Green Way, Sunamganj'},
    {'type': 'Office', 'address': 'Medical Road, Halal Lab, Sunamganj'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xff1AB65C),
        title: Row(
          children: [
            IconButton(
              icon: SvgPicture.asset(
                'assets/icons/left-arro-icon.svg',
                color: Colors.white,
                height: 24,
                width: 24,
              ),
              onPressed: () => Get.back(),
            ),
            Text(
              'Checkout',
              style: montserrat700.copyWith(fontSize: 24, color: Colors.white),
            ),
          ],
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(7)),
        ),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30),
            Text(
              'Delivery Address',
              style:
                  poppins400.copyWith(fontSize: 16, color: Color(0xff000000)),
            ),

            SizedBox(height: 10), // Space after "Add New Address"
            Expanded(
              child: ListView.builder(
                itemCount: addresses.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      AddressTile(
                        type: addresses[index]['type']!,
                        address: addresses[index]['address']!,
                        isSelected: selectedAddressIndex == index,
                        onTap: () {
                          setState(() {
                            selectedAddressIndex = index;
                          });
                        },
                        onEdit: () {
                          // Handle editing the address
                        },
                      ),
                      SizedBox(height: index == addresses.length - 1 ? 20 : 0),
                      if (index == addresses.length - 1)
                        InkWell(
                          onTap: () {
                            Get.offNamed(AppRoutes.registerInfo);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                            child: CustomPaint(
                              painter: DottedBorderPainter(),
                              child: Padding(
                                padding: const EdgeInsets.all(30),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'assets/images/round-add-icon.png',
                                      height: 22,
                                      width: 22,
                                    ),
                                    SizedBox(width: 10),
                                    Text(
                                      'Add New Address',
                                      style:
                                          TextStyle(color: Color(0xff1E222B)),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                    ],
                  );
                },
              ),
            ),

            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Proceed to the next step (e.g., payment)

                Get.offNamed(AppRoutes.orderSuccess);
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 16),
                backgroundColor: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Center(
                child: Text(
                  'Order Now',
                  style: montserrat500.copyWith(
                      fontSize: 16, color: Color(0xffFFFFFF)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DottedBorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Color(0xffF8F9FB)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    double dashWidth = 4;
    double dashSpace = 4;
    double startX = 0;

    while (startX < size.width) {
      canvas.drawLine(Offset(startX, 0), Offset(startX + dashWidth, 0), paint);
      startX += dashWidth + dashSpace;
    }

    startX = 0;
    while (startX < size.height) {
      canvas.drawLine(Offset(0, startX), Offset(0, startX + dashWidth), paint);
      startX += dashWidth + dashSpace;
    }

    startX = 0;
    while (startX < size.width) {
      canvas.drawLine(Offset(startX, size.height),
          Offset(startX + dashWidth, size.height), paint);
      startX += dashWidth + dashSpace;
    }

    startX = 0;
    while (startX < size.height) {
      canvas.drawLine(Offset(size.width, startX),
          Offset(size.width, startX + dashWidth), paint);
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class AddressTile extends StatelessWidget {
  final String type;
  final String address;
  final bool isSelected;
  final VoidCallback onTap;
  final VoidCallback onEdit;

  AddressTile({
    required this.type,
    required this.address,
    required this.isSelected,
    required this.onTap,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(
              color: isSelected ? Colors.orangeAccent : Colors.grey.shade300),
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    type,
                    style: poppins400.copyWith(
                        fontSize: 14, color: Color(0xff1E222B)),
                  ),
                  SizedBox(height: 5),
                  Text(
                    address,
                    style: poppins600.copyWith(
                        fontSize: 14, color: Color(0xff000000)),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                isSelected
                    ? Container(
                        width: 22, // Set the width of the circle
                        height: 22, // Set the height of the circle
                        decoration: BoxDecoration(
                          color: Color(0xffF9B023), // Circle color
                          shape: BoxShape.circle, // Make it a circle
                        ),
                        child: Icon(
                          Icons.check, // Icon to display
                          color: Colors.black, // Icon color
                          size: 18, // Size of the icon
                        ),
                      )
                    : SizedBox.shrink(),
                IconButton(
                  onPressed: onEdit,
                  icon: Text(
                    'Edit',
                    style: poppins500.copyWith(
                        fontSize: 12, color: Color(0xff2A4BA0)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
