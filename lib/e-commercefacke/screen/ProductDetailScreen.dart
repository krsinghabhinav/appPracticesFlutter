import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/cart_controller.dart';
import '../controller/wishlist_controller.dart';
import '../model/product_model.dart';
import 'CartPage.dart';
import 'wishlist_page.dart';

class ProductDetailScreen extends StatelessWidget {
  final ProductModel productModel;
  ProductDetailScreen(this.productModel);
  CartCotn cartController = Get.put(CartCotn());
  WishlistCont wishlistController = Get.put(WishlistCont());
  @override
  Widget build(BuildContext context) {
    // final ProductModel product = Get.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(productModel.title.toString()),
        actions: [
          IconButton(
            icon: Obx(() {
              bool isFav = wishlistController.isInWishlist(productModel);
              return Icon(
                isFav ? Icons.favorite : Icons.favorite_border,
                color:
                    isFav ? Colors.red : const Color.fromARGB(255, 69, 68, 68),
              );
            }),
            onPressed: () => wishlistController.toggleWishlist(productModel),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Get.to(() => CartPage()),
        label: Text("Cart"),
        icon: Icon(Icons.shopping_cart),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.network(productModel.image.toString(), height: 150),
            SizedBox(height: 20),
            Text(
              productModel.title.toString(),
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text('\$${productModel.price}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text(productModel.description.toString()),
            Spacer(),
            Obx(() {
              final inCart = cartController.isInCart(productModel);
              return ElevatedButton.icon(
                onPressed: () {
                  if (inCart) {
                    cartController.removefromCart(productModel);
                  } else {
                    cartController.addtoCart(productModel);
                  }
                },
                icon: Icon(
                  inCart ? Icons.remove_shopping_cart : Icons.add_shopping_cart,
                ),
                label: Text(inCart ? 'Remove from Cart' : 'Add to Cart'),
              );
            }),
            ElevatedButton(
              onPressed: () {
                Get.to(() => WishlistPage());
              },
              child: Text("wishlist"),
            ),
          ],
        ),
      ),
    );
  }
}
