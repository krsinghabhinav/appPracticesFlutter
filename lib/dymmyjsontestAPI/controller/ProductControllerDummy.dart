import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class Productcontrollerdummy extends GetxController {
  RxList<String> myCategories = <String>[].obs;
  RxList<dynamic> productDataList = <dynamic>[].obs;
  RxBool isLoading = false.obs;
  RxString selectedCategory = 'All'.obs;

  @override
  void onInit() {
    super.onInit();
    fetchCategories();
  }

  Future<void> fetchCategories() async {
    isLoading.value = true;
    final url = Uri.parse('https://dummyjson.com/products');

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final List<dynamic> products = jsonDecode(response.body)['products'];
        final Set<String> fetchedCategories = {"All"};
        for (var product in products) {
          fetchedCategories.add(product['category']);
        }

        myCategories.value = fetchedCategories.toList();
        isLoading.value = false;

        fetchData('All');
      }
    } catch (e) {
      isLoading.value = false;
      print("Error: $e");
    }
  }

  Future<void> fetchData(String category) async {
    isLoading.value = true;
    final url = Uri.parse('https://dummyjson.com/products');

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final List<dynamic> products = jsonDecode(response.body)['products'];
        List<dynamic> filtered = [];

        for (var product in products) {
          if (category == 'All' || product['category'] == category) {
            filtered.add(product);
          }
        }

        productDataList.value = filtered;
        selectedCategory.value = category;
        isLoading.value = false;
      }
    } catch (e) {
      isLoading.value = false;
      print("Error: $e");
    }
  }
}
