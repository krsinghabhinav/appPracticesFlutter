import 'package:apppreacticeall/e-commercefacke/response/product_Repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'dart:math';

import '../model/product_model.dart';

class ProductController extends GetxController {
  ProductRepo _productRepo = ProductRepo();

  var productList = <ProductModel>[].obs;
  var isloading = false.obs;
  var filterlist = <ProductModel>[].obs;
  var currentRange = RangeValues(0, 50000).obs;
  var selectedSort = ''.obs;
  var search = ''.obs;
  TextEditingController searchController = TextEditingController();
  // List<String> get allBrands => productList.map((e) => e.brand).toSet().toList();

  Future<void> fetchProduct(String category) async {
    try {
      isloading.value = true;
      var response = await _productRepo.getproduct(category);
      productList.value = response.toList();
      filterlist.assignAll(response);

      double minPrice = response.map((e) => e.price!.toDouble()).reduce(min);
      double maxPrice = response.map((e) => e.price!.toDouble()).reduce(max);
      currentRange.value = RangeValues(minPrice, maxPrice);
    } catch (e) {
      print("Error: $e");
    } finally {
      isloading.value = false;
    }
  }

  void searchProduct(String query) {
    search.value = query.toLowerCase().trim();
    final filtered =
        productList
            .where((product) => product.title!.toLowerCase().contains(search))
            .toList();

    filterlist.assignAll(filtered);
  }

  void applyFilters() {
    List<ProductModel> temp =
        productList.where((product) {
          return product.price! >= currentRange.value.start &&
              product.price! <= currentRange.value.end;
        }).toList();

    if (selectedSort.value == 'Low to High') {
      temp.sort((a, b) => a.price!.compareTo(b.price!));
    } else if (selectedSort.value == 'High to Low') {
      temp.sort((a, b) => b.price!.compareTo(a.price!));
    }

    filterlist.assignAll(temp);
  }

  void setSort(String value) {
    selectedSort.value = value;
    applyFilters();
  }

  void setPriceRange(RangeValues values) {
    currentRange.value = values;
    applyFilters();
  }
}
