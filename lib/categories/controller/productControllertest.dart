import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../model/productcategoryModel.dart';

class Productcontrollertest extends GetxController {
  var productList = <Productcategorymodel>[].obs;
  var isDataLoadingCompleted = false.obs;

  Future<void> fetchData() async {
    try {
     final productJson = await rootBundle.loadString("assets/jsonText/product.json");

      print("productJson=====${productJson}");
      var productJsonDecode = jsonDecode(productJson);

      productList.value =
          List.from(
            productJsonDecode,
          ).map((e) => Productcategorymodel.fromJson(e)).toList();

      isDataLoadingCompleted.value = true;
    } catch (e) {
      print("Error loading product data: $e");
      isDataLoadingCompleted.value = false;
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchData();
  }
}
