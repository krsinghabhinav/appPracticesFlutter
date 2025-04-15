import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/ProductControllerDummy.dart';

class Dummyuidatabycontrol extends StatelessWidget {
  final Productcontrollerdummy controller = Get.put(Productcontrollerdummy());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Categories")),
      body: Column(
        children: [
          Obx(() {
            if (controller.isLoading.value && controller.myCategories.isEmpty) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return SizedBox(
                height: 60,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.myCategories.length,
                  itemBuilder: (context, index) {
                    final category = controller.myCategories[index];
                    final isSelected =
                        category == controller.selectedCategory.value;

                    return GestureDetector(
                      onTap: () => controller.fetchData(category),
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 10,
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: isSelected ? Colors.blue : Colors.grey,
                          ),
                          borderRadius: BorderRadius.circular(20),
                          color: isSelected ? Colors.amber : Colors.white,
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          category,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color:
                                isSelected
                                    ? Colors.white
                                    : const Color.fromARGB(255, 65, 64, 64),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            }
          }),

          // Products Grid
          Obx(() {
            if (controller.isLoading.value) {
              return const Expanded(
                child: Center(child: CircularProgressIndicator()),
              );
            } else {
              return Expanded(
                child: GridView.builder(
                  itemCount: controller.productDataList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: 220,
                  ),
                  itemBuilder: (context, index) {
                    final product = controller.productDataList[index];
                    return Card(
                      elevation: 2,
                      margin: const EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.network(
                            product['thumbnail'] ?? '',
                            height: 100,
                            width: double.infinity,
                            fit: BoxFit.contain,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              product['title'] ?? '',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8.0,
                            ),
                            child: Text("₹${product['price']}"),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              );
            }
          }),
        ],
      ),
    );
  }
}
