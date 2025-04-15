import 'package:apppreacticeall/e-commercefacke/model/product_model.dart';
import 'package:get/get.dart';

class CartCotn extends GetxController {
  var cartList = <ProductModel>[].obs;

  void addtoCart(ProductModel product) {
    cartList.add(product);
  }

  void removefromCart(ProductModel product) {
    cartList.remove(product);
  }

  bool isInCart(ProductModel product) {
    return cartList.any((item) => item.id == product.id);
  }

  double get totalPrice => cartList.fold(0, (sum, item) => sum + (item.price ?? 0));
}
