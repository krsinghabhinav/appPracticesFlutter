import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/OrderController.dart';
import '../controller/cart_controller.dart';
import '../model/product_model.dart'; // Ensure correct import

class CartPage extends StatelessWidget {
  CartPage({super.key});

  final CartCotn cartController = Get.put(CartCotn());
  final OrderController orderController = Get.put(OrderController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Your Cart")),
      body: Obx(() {
        if (cartController.cartList.isEmpty) {
          return const Center(child: Text("Your cart is empty 🛒"));
        }

        return Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: cartController.cartList.length,
                itemBuilder: (_, index) {
                  final item = cartController.cartList[index];
                  return ListTile(
                    leading: Image.network(
                      item.image ?? '',
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                    title: Text(item.title ?? ''),
                    subtitle: Text("₹${item.price}"),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () => cartController.removefromCart(item),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Obx(() => Text(
                        "Total: ₹${cartController.totalPrice.toStringAsFixed(2)}",
                        style: const TextStyle(fontSize: 18),
                      )),
                  ElevatedButton(
                    onPressed: () {
                      if (cartController.cartList.isNotEmpty) {
                        orderController.placeOrder(
                          cartController.cartList.toList(),
                        );
                        cartController.cartList.clear(); // Clear cart
                        Get.snackbar(
                          "Order Placed",
                          "Your order has been placed successfully!",
                          backgroundColor: Colors.green,
                          colorText: Colors.white,
                        );
                      }
                    },
                    child: const Text("Checkout"),
                  ),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}
