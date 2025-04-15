import 'package:get/get.dart';

import '../model/product_model.dart';

class WishlistCont extends GetxController {
  var wishlist = <ProductModel>[].obs;

  void toggleWishlist(ProductModel product) {
    if (wishlist.any((item) => item.id == product.id)) {
      wishlist.removeWhere((item) => item.id == product.id);
    } else {
      wishlist.add(product);
    }
  }

  bool isInWishlist(ProductModel product) {
    return wishlist.any((item) => item.id == product.id);
  }
}
