import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../res/fonts/app_fonts.dart';
import '../../../../res/routes/routes_name.dart';

class MyCartPage extends StatelessWidget {
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
              'My Cart',
              style: montserrat700.copyWith(fontSize: 24, color: Colors.white),
            ),
          ],
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(7)),
        ),
        automaticallyImplyLeading: false,
      ),
      body: CartPage(),
    );
  }
}

class CartPage extends StatelessWidget {
  final deliveryFee = 2.00.obs;
  final cartItems = RxList<Map<String, dynamic>>([
    {
      'name': 'Bananas',
      'price': 7.90,
      'quantity': 2,
      'imageUrl': 'assets/images/pd-8.png'
    },
    {
      'name': 'Package 01',
      'price': 7.90,
      'quantity': 2,
      'imageUrl': 'assets/images/pd-7.png'
    },
    {
      'name': 'Package 02',
      'price': 7.90,
      'quantity': 2,
      'imageUrl': 'assets/images/pd-9.png'
    },
    {
      'name': 'Bananas',
      'price': 7.90,
      'quantity': 2,
      'imageUrl': 'assets/images/pd-10.png'
    },
    {
      'name': 'Package 03',
      'price': 7.90,
      'quantity': 2,
      'imageUrl': 'assets/images/pd-11.png'
    },
    {
      'name': 'Bananas',
      'price': 7.90,
      'quantity': 2,
      'imageUrl': 'assets/images/pd-8.png'
    },
    {
      'name': 'Package 01',
      'price': 7.90,
      'quantity': 2,
      'imageUrl': 'assets/images/pd-7.png'
    },
    {
      'name': 'Package 02',
      'price': 7.90,
      'quantity': 2,
      'imageUrl': 'assets/images/pd-9.png'
    },
    {
      'name': 'Bananas',
      'price': 7.90,
      'quantity': 2,
      'imageUrl': 'assets/images/pd-10.png'
    },
    {
      'name': 'Package 03',
      'price': 7.90,
      'quantity': 2,
      'imageUrl': 'assets/images/pd-11.png'
    },
  ]);

  double calculateSubtotal() {
    return cartItems.fold(
        0.0, (sum, item) => sum + (item['price'] * item['quantity']));
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      double subtotal = calculateSubtotal();
      double total = subtotal + deliveryFee.value;

      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListView.builder(
                shrinkWrap: true, // Allow ListView to take only the required height
                physics: NeverScrollableScrollPhysics(), // Disable ListView scrolling
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  final item = cartItems[index];
                  return CartItem(
                    item: item,
                    onQuantityChanged: (newQuantity) {
                      cartItems[index]['quantity'] = newQuantity;
                      cartItems.refresh(); // Refresh the list to update UI
                    },
                    onRemove: () {
                      cartItems.removeAt(index);
                    },
                  );
                },
              ),
              SizedBox(height: 16), // Space between items and summary
              CartSummary(
                  subtotal: subtotal,
                  deliveryFee: deliveryFee.value,
                  total: total),
            ],
          ),
        ),
      );
    });
  }
}

class CartItem extends StatelessWidget {
  final Map<String, dynamic> item;
  final Function(int) onQuantityChanged;
  final VoidCallback onRemove;

  CartItem({
    required this.item,
    required this.onQuantityChanged,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    final String imageUrl = item['imageUrl'] ?? '';
    final String name = item['name'] ?? 'Item';
    final double price = item['price'] ?? 0.0;
    final int quantity = item['quantity'] ?? 1;

    return Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.all(8),
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              imageUrl,
              width: 46,
              height: 36,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                width: 46,
                height: 36,
                color: Colors.grey,
              ),
            ),
          ),
          title: Text(
            name,
            style: manrope500.copyWith(
              fontSize: 14,
              color: Color(0xff1E222B),
            ),
          ),
          subtitle: Text(
            '₹${price.toStringAsFixed(2)}',
            style: manrope400.copyWith(
              fontSize: 14,
              color: Color(0xff1E222B),
            ),
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Color(0xffF8F9FB),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: IconButton(
                  onPressed: () {
                    if (quantity > 1) {
                      onQuantityChanged(quantity - 1);
                    }
                  },
                  icon: SizedBox(
                    width: 24,
                    height: 24,
                    child: Icon(Icons.remove),
                  ),
                ),
              ),
              SizedBox(width: 10),
              Text(
                '$quantity',
                style: manrope400.copyWith(
                  fontSize: 14,
                  color: Color(0xff1E222B),
                ),
              ),
              SizedBox(width: 10),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xffF8F9FB),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: IconButton(
                  onPressed: () {
                    onQuantityChanged(quantity + 1);
                  },
                  icon: SizedBox(
                    width: 24,
                    height: 24,
                    child: Icon(Icons.add),
                  ),
                ),
              ),
              SizedBox(width: 10),
              IconButton(
                onPressed: onRemove,
                icon: Icon(Icons.delete, color: Colors.green),
              ),
            ],
          ),
        ),
        // Divider at the bottom of the CartItem
        Container(
          height: 0.5,
          color: Color(0xFFEBEBFB), // Divider color
          margin: EdgeInsets.symmetric(vertical: 4),
        ),
      ],
    );
  }
}

class CartSummary extends StatelessWidget {
  final double subtotal;
  final double deliveryFee;
  final double total;

  CartSummary({
    required this.subtotal,
    required this.deliveryFee,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 35,
        right: 35,
        top: 17,
        bottom: 30,
      ),
      decoration: BoxDecoration(
        color: Color(0xffF8F9FB),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          summaryRow('Subtotal', subtotal),
          SizedBox(height: 8),
          summaryRow('Delivery', deliveryFee),
          SizedBox(height: 8),
          summaryRow('Total', total, isTotal: true),
          SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                // Add to cart functionality
                Get.toNamed(AppRoutes.checkout);
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 12),
                backgroundColor: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7),
                ),
              ),
              child: Text(
                'Process to Checkout',
                style: poppins500.copyWith(fontSize: 16, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Row summaryRow(String title, double amount, {bool isTotal = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: manrope400.copyWith(fontSize: isTotal ? 15 : 16, color: Color(0xff1E222B))),
        Text('₹${amount.toStringAsFixed(2)}',
            style: manrope400.copyWith(fontSize: isTotal ? 15 : 16, color: Color(0xff1E222B))),
      ],
    );
  }
}
