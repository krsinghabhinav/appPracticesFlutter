import 'package:get/get.dart';
import '../model/categoryProductModel.dart';
import '../repo/productrepo.dart';

class DummyJsonProductController extends GetxController {
  final DummyJsonProductRepo dummyJsonProductRepo = DummyJsonProductRepo();

  var dummyData = Rxn<DummyProductModel>();
  var isLoading = false.obs;

  var productList = <Products>[].obs;
  var categoryList = <String>[].obs;
  var selectedCategory = 'All'.obs;

  Future<void> getDummyData() async {
    try {
      isLoading.value = true;
      final response = await dummyJsonProductRepo.getDummyData();
      if (response != null) {
        dummyData.value = response;

        final products = response.products ?? [];
        productList.assignAll(products);

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

  void filterByCategory(String category) {
    selectedCategory.value = category;
    if (category == 'All') {
      productList.assignAll(dummyData.value?.products ?? []);
    } else {
      productList.assignAll(
        (dummyData.value?.products ?? [])
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
