import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/DummyJsonProductContro.dart';

class ProductListScreen extends StatelessWidget {
  final DummyJsonProductController controller = Get.put(
    DummyJsonProductController(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Product List')),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else {
          return Column(
            children: [
              // Category Filter
              Container(
                padding: EdgeInsets.all(8),
                child: Wrap(
                  children:
                      controller.categoryList.map((category) {
                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          child: ChoiceChip(
                            label: Text(category),
                            selected:
                                controller.selectedCategory.value == category,
                            onSelected: (selected) {
                              controller.filterByCategory(category);
                            },
                          ),
                        );
                      }).toList(),
                ),
              ),

              Expanded(
                child:
                    controller.productList.isEmpty
                        ? Center(
                          child: Text(
                            'No products available for this category',
                          ),
                        )
                        : ListView.builder(
                          itemCount: controller.productList.length,
                          itemBuilder: (context, index) {
                            final product = controller.productList[index];
                            return ListTile(
                              title: Text(product.title ?? 'No Title'),
                              subtitle: Text('Price: \$${product.price}'),
                              leading: Image.network(
                                product.thumbnail ?? '',
                                width: 50,
                                height: 50,
                              ),
                            );
                          },
                        ),
              ),
            ],
          );
        }
      }),
    );
  }
}
