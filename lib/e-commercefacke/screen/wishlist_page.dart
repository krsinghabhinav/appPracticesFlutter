import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/wishlist_controller.dart';
import 'ProductDetailScreen.dart';

class WishlistPage extends StatelessWidget {
  WishlistPage({super.key});
  WishlistCont wishlistController = Get.put(WishlistCont());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("My Wishlist")),
      body: Obx(() {
        if (wishlistController.wishlist.isEmpty) {
          return Center(child: Text("No items in wishlist ❤️"));
        }
        return ListView.builder(
          itemCount: wishlistController.wishlist.length,
          itemBuilder: (_, index) {
            final product = wishlistController.wishlist[index];
            return ListTile(
              leading: Image.network(product.image.toString(), width: 50),
              title: Text(product.title.toString()),
              subtitle: Text("₹${product.price}"),
              trailing: Icon(Icons.favorite, color: Colors.red),
              onTap: () => Get.to(() => ProductDetailScreen(product)),
            );
          },
        );
      }),
    );
  }
}
