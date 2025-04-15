import 'package:get/get.dart';

class TestCategorycontroller extends GetxController {
  var currentIndex = 0.obs;

  List<String> categories =
      [
        'Electronics',
        'Fashion',
        'Groceries',
        'Home & Kitchen',
        'Books',
        'Toys & Games',
        'Health & Beauty',
        'Sports & Fitness',
        'Automotive',
        'Stationery',
      ].obs;

  void changeIndex(int index) {
    currentIndex.value = index;
  }
}
