
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderHistoryPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Order History')),
      // body: FutureBuilder(
      //   future: _orderViewModel.fetchOrders(),
      //   builder: (context, snapshot) {
      //     if (snapshot.connectionState == ConnectionState.waiting) {
      //       return Center(child: CircularProgressIndicator());
      //     }
      //
      //     return Obx(() {
      //       if (_orderViewModel.orders.isEmpty) {
      //         return Center(child: Text('No orders found.'));
      //       }
      //       return ListView.builder(
      //         itemCount: _orderViewModel.orders.length,
      //         itemBuilder: (context, index) {
      //           final order = _orderViewModel.orders[index];
      //           return ListTile(
      //             title: Text('Order ID: ${order.orderId}'),
      //             subtitle: Text('Products: ${order.productIds.join(', ')}'),
      //             onTap: () {
      //               // Navigate to Order Details Page (if you have one)
      //             },
      //           );
      //         },
      //       );
      //     });
      //   },
      // ),
    );
  }
}
