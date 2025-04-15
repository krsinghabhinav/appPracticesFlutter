import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/CategoryController.dart';
import '../controller/productControllertest.dart';

class CategoryUI extends StatelessWidget {
  CategoryUI({super.key});

  final TestCategorycontroller categoryController = Get.put(
    TestCategorycontroller(),
  );
  final Productcontrollertest productcontrollertest = Get.put(
    Productcontrollertest(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Category UI')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          SizedBox(
            height: 60,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categoryController.categories.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    categoryController.changeIndex(index);
                    print("Selected: ${categoryController.categories[index]}");
                  },
                  child: Obx(
                    () => Container(
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color:
                            categoryController.currentIndex.value == index
                                ? Colors.redAccent
                                : Colors.grey[300],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text(
                          categoryController.categories[index],
                          style: TextStyle(
                            color:
                                categoryController.currentIndex.value == index
                                    ? Colors.white
                                    : Colors.black87,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          const SizedBox(height: 20),

          Obx(
            () => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'You selected: ${categoryController.categories[categoryController.currentIndex.value]}',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),

          const SizedBox(height: 10),

          // Grid view wrapped with Expanded inside Obx
          Expanded(
            child: Obx(
              () => GridView.builder(
                padding: const EdgeInsets.all(16),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                itemCount: productcontrollertest.productList.length,
                itemBuilder: (context, index) {
                  final product = productcontrollertest.productList[index];

                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 4,
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child:
                              product.images != null
                                  ? Image.asset(
                                    product.images.toString()!,
                                    fit: BoxFit.cover,
                                    errorBuilder:
                                        (context, error, stackTrace) =>
                                            const Icon(
                                              Icons.image_not_supported,
                                            ),
                                  )
                                  : const Icon(Icons.image),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            product.name ?? 'No Name',
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
