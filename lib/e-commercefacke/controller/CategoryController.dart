import 'package:apppreacticeall/e-commercefacke/baseUrl/apiBaseUrl.dart';
import 'package:apppreacticeall/e-commercefacke/model/category_model.dart';
import 'package:apppreacticeall/serverhepler/apihelperserver.dart';
import 'package:get/get.dart';

import '../response/CategoryReposetry.dart';

class CategoryCont extends GetxController {
  Apihelperserver apihelperserver = Apihelperserver(); // API helper instance
  var categoryList = <CategoryModel>[].obs;
  // Observable list to store categories
  var isLoading = false.obs;
  var selectedCategoryIndex = 0.obs;
  Categoryreposetry categoryreposetry =
      Categoryreposetry(); // Repository instance
  Future<void> fetchCategory() async {
    try {
      isLoading.value = true;
      final response = await categoryreposetry.getcategory();
      categoryList.value = response;
      print("categoryList.value==${categoryList}");
    } catch (e) {
      print("Error fetching categories: $e");
    } finally {
      isLoading.value = false;
    }
  }

  void changeIndex(index) {
    selectedCategoryIndex.value = index;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchCategory();
  }
}
