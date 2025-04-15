import 'package:get/get.dart';

import '../model/product_model.dart';

class OrderController extends GetxController {
  var orders = <ProductModel>[].obs;

  void placeOrder(List<ProductModel> cartItems) {
    orders.addAll(cartItems);
  }
}
