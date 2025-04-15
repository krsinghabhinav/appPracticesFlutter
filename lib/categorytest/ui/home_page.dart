import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/category_controller.dart';
import 'subitem_page.dart';

class HomePageScreen extends StatelessWidget {
  final controller = Get.put(CategoryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Categories")),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Obx(
            () => SizedBox(
              height: 60,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: controller.categories.length,
                itemBuilder: (context, index) {
                  final cat = controller.categories[index];
                  print(
                    "controller.selectedCategoryIndex.value ${controller.selectedCategoryIndex.value}",
                  );
                  return GestureDetector(
                    onTap: () => controller.selectedCategoryIndex.value = index,

                    child: Obx(
                      () => Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 10,
                        ),
                        margin: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color:
                              controller.selectedCategoryIndex.value == index
                                  ? Colors.blue
                                  : Colors.grey[300],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(child: Text(cat.name)),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          SizedBox(height: 10),
          Obx(
            () => Expanded(
              child: ListView.builder(
                itemCount: controller.selectedItems.length,
                itemBuilder: (context, index) {
                  final item = controller.selectedItems[index];
                  print(
                    "controller.selectedCategoryIndex.value ${controller.selectedCategoryIndex.value}",
                  );
                  return ListTile(
                    leading: Image.network(item.image, width: 50),
                    title: Text(item.name),
                    onTap: () {
                      Get.to(() => SubitemPage(subitems: item.subitems));
                    },
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
