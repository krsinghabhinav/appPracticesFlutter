import 'package:get/get.dart';
import '../model/category_model.dart';
import '../model/dummyCategorydata.dart';

class CategoryController extends GetxController {
  var categories = <Category>[].obs;
  var selectedCategoryIndex = 0.obs;

  @override
  void onInit() {
    categories.value = dummycategories;
    super.onInit();
  }

  List<Item> get selectedItems =>
      categories[selectedCategoryIndex.value].items;
}
