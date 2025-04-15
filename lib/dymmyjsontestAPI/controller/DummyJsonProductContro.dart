import 'package:apppreacticeall/dymmyjsontestAPI/model/categoryProductModel.dart';
import 'package:apppreacticeall/dymmyjsontestAPI/repo/productrepo.dart';
import 'package:get/get.dart';

class DummyJsonProductController extends GetxController {
  final DummyJsonProductRepo dummyJsonProductRepo = DummyJsonProductRepo();

  var dummyData = DummyProductModel().obs;
  var isLoading = false.obs;

  var productList = <Products>[].obs;
  var categoryList = <String>[].obs;
  var selectedCategory = 'All'.obs; // Track the selected category

  // Function to get the data
  Future<void> getDummyData() async {
    try {
      isLoading.value = true;

      final response = await dummyJsonProductRepo.getDummyData();
      if (response != null) {
        dummyData.value = response;

        final products = response.products ?? [];
        productList.assignAll(products);

        // Add unique categories including 'All'
        final categories = <String>{'All'};
        for (var product in products) {
          if (product.category != null) {
            categories.add(product.category!);
          }
        }
        categoryList.assignAll(categories.toList());
      }
    } catch (e) {
      print('Error fetching dummy data: $e');
    } finally {
      isLoading.value = false;
    }
  }

  // Function to filter products based on the selected category
  void filterByCategory(String category) {
    selectedCategory.value = category;
    if (category == 'All') {
      productList.assignAll(dummyData.value.products ?? []);
    } else {
      productList.assignAll(
        (dummyData.value.products ?? [])
            .where((product) => product.category == category)
            .toList(),
      );
    }
  }

  @override
  void onInit() {
    super.onInit();
    getDummyData();
  }
}
