import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../categorytest/controller/category_controller.dart';
import '../controller/CategoryController.dart';
import '../controller/product_controller.dart';
import 'ProductDetailScreen.dart';


class EcommerceHomePage extends StatefulWidget {
  @override
  State<EcommerceHomePage> createState() => _EcommerceHomePageState();
}

class _EcommerceHomePageState extends State<EcommerceHomePage> {
  final CategoryCont categoryCont = Get.put(CategoryCont());
  final ProductController productController = Get.put(ProductController());

  @override
  void initState() {
    super.initState();
    ever(categoryCont.categoryList, (_) {
      if (categoryCont.categoryList.isNotEmpty) {
        productController.fetchProduct(categoryCont.categoryList[0].name);
        categoryCont.changeIndex(0);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Categories")),
      body: Column(
        children: [
          // 🔍 Search Bar
          Container(
            height: 50,
            margin: EdgeInsets.all(12),
            padding: EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(15),
            ),
            child: TextField(
              controller: productController.searchController,
              onChanged: productController.searchProduct,
              decoration: InputDecoration(
                hintText: 'Search product...',
                border: InputBorder.none,
              ),
            ),
          ),

          // 🔽 Sort & 🎚 Filter UI
          _obxFilterUI(productController),

          // 📂 Category List
          SizedBox(
            height: 60,
            child: Obx(() {
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categoryCont.categoryList.length,
                itemBuilder: (context, index) {
                  final category = categoryCont.categoryList[index];
                  final isSelected =
                      categoryCont.selectedCategoryIndex.value == index;

                  return GestureDetector(
                    onTap: () {
                      categoryCont.changeIndex(index);
                      productController.fetchProduct(category.name);
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                      margin: EdgeInsets.symmetric(horizontal: 6),
                      decoration: BoxDecoration(
                        color: isSelected ? Colors.blue : Colors.grey[300],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Text(
                          category.name,
                          style: TextStyle(
                            color: isSelected ? Colors.white : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            }),
          ),

          // 🛍️ Product Grid
          Expanded(
            child: Obx(() {
              if (productController.isloading.value) {
                return Center(child: CircularProgressIndicator());
              }

              return GridView.builder(
                itemCount: productController.filterlist.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 220,
                ),
                itemBuilder: (context, index) {
                  final product = productController.filterlist[index];
                  return GestureDetector(
                    onTap: () => Get.to(() => ProductDetailScreen(product)),
                    child: Card(
                      elevation: 2,
                      margin: EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.network(
                            product.image ?? '',
                            height: 100,
                            width: double.infinity,
                            fit: BoxFit.contain,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              product.title ?? '',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text("₹${product.price}"),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget _obxFilterUI(ProductController controller) {
    return Obx(() {
      return Column(
        children: [
          // 🔽 Sort Options
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ChoiceChip(
                label: Text("Low to High"),
                selected: controller.selectedSort.value == "Low to High",
                onSelected: (_) => controller.setSort("Low to High"),
              ),
              ChoiceChip(
                label: Text("High to Low"),
                selected: controller.selectedSort.value == "High to Low",
                onSelected: (_) => controller.setSort("High to Low"),
              ),
            ],
          ),
          SizedBox(height: 10),

          // 🎚 Price Range Slider
          Column(
            children: [
              Text(
                "Price Range: ₹${controller.currentRange.value.start.toInt()} - ₹${controller.currentRange.value.end.toInt()}",
              ),
              RangeSlider(
                values: controller.currentRange.value,
                min: controller.productList.isNotEmpty
                    ? controller.productList
                        .map((e) => e.price ?? 0.0)
                        .reduce(min)
                    : 0,
                max: controller.productList.isNotEmpty
                    ? controller.productList
                        .map((e) => e.price ?? 0.0)
                        .reduce(max)
                    : 1000,
                onChanged: controller.setPriceRange,
                divisions: 20,
                labels: RangeLabels(
                  "₹${controller.currentRange.value.start.toInt()}",
                  "₹${controller.currentRange.value.end.toInt()}",
                ),
              ),
            ],
          ),
        ],
      );
    });
  }
}